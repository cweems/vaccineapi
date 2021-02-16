class CreateClinics < ActiveRecord::Migration[6.1]
  def change
    create_table :clinics do |t|
      t.string :title
      t.datetime :date
      t.string :address
      t.string :vaccinations_offered
      t.string :age_groups_served
      t.string :services_offered
      t.string :additional_information
      t.string :clinic_hours
      t.string :available_appointments
      t.timestamps
    end
  end
end
