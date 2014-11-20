class CreateDevelopmentalLevels < ActiveRecord::Migration
  def change
    create_table :developmental_levels do |t|
      t.string :student_id
      t.datetime :date_on
      t.string :recorder
      t.string :fba_not_present
      t.string :fba_fleeting
      t.string :fba_constricted
      t.string :fba_stable
      t.string :ibc_not_present
      t.string :ibc_fleeting
      t.string :ibc_constricted
      t.string :ibc_stable
      t.string :sm_not_present
      t.string :sm_fleeting
      t.string :sm_constricted
      t.string :sm_stable
      t.string :p_not_present
      t.string :p_fleeting
      t.string :p_constricted
      t.string :p_stable
      t.string :d_not_present
      t.string :d_fleeting
      t.string :d_constricted
      t.string :d_stable
      t.string :wo_not_present
      t.string :wo_fleeting
      t.string :wo_constricted
      t.string :wo_stable
      t.string :duration

      t.timestamps
    end
  end
end
