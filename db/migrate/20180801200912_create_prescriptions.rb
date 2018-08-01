class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.string :drug
      t.integer :dosage_in_milligrams
      t.integer :doctor_id
      t.integer :patient_id

      t.timestamps
    end
  end
end