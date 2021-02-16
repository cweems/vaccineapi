class CreateInstances < ActiveRecord::Migration[6.1]
  def change
    create_table :instances do |t|
      t.string :state
      t.string :url
      t.string :status
      t.timestamps
    end
  end
end
