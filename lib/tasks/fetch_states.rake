namespace :instances do
    desc "I am short, but comprehensive description for my cool task"
    task fetch: :environment do

        Instance.all.each do |row|
            uri = URI("https://cw2-#{row.state}-production.herokuapp.com/")
            puts uri
            response = Net::HTTP.get_response(uri)

            if response.code == "200"
                puts row.state
                puts response.code

                row.update(status: 'active')
            end
        end

        puts "Total instances #{Instance.count}"
    end
end