namespace :clinics do
    task scrape: :environment do
        @driver = Selenium::WebDriver.for :chrome
        Instance.where(status: 'active').each do |instance|
            @driver.get "#{instance.url}/clinic/search"
            puts "#{instance.url}/clinic/search"
            
            def scrape_page()
                clinic_list = @driver.find_element(:css, '.border-t')

                begin
                clinics = clinic_list.find_elements(:css, '.md\:flex-shrink.text-gray-800')

                    clinics.each do |clinic|
                        
                        paragraphs = clinic.find_elements(:tag_name, 'p')
                        title_hash = "CL#{Digest::MD5.hexdigest(paragraphs[0].text)}"

                        record = Clinic.find_or_initialize_by(title_hash: title_hash)
                        header = paragraphs[0].text.split(" on ")

                        record[:title] = header[0]
                        record[:date] = Date.strptime(header[1], "%m/%d/%Y")

                        record[:address] = paragraphs[1].text

                        items = paragraphs[2..]

                        items.each do |item|
                            split = item.text.split(": ")
                            key = split[0].parameterize.underscore.to_sym

                            begin
                                record[key] = split[1]
                            rescue ActiveModel::MissingAttributeError
                                puts "Invalid attribute #{key}"
                            end
                        end

                        record.save!
                    end
                
                rescue Selenium::WebDriver::Error::NoSuchElementError
                    puts "No appointments found"
                end

                begin
                    next_link = @driver.find_element(:xpath, "//a[@aria-label='next']")
                    if next_link.enabled?
                        next_link.click
                        sleep(2)
                        scrape_page()
                    end
                
                rescue Selenium::WebDriver::Error::NoSuchElementError
                    puts "Done."
                end
            end

            scrape_page()

        end
    end
end
