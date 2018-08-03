class CreateAilments < ActiveRecord::Migration[5.2]
  def change
    create_table :ailments do |t|
      t.text :description
      t.integer :length_in_days
      t.boolean :resolved_status, default: false
      t.integer :patient_id

      t.timestamps
    end
  end
end
