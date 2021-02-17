class AddTitleHashToClinic < ActiveRecord::Migration[6.1]
  def change
    add_column  :clinics, :title_hash, :string, :unique => true
  end
end
