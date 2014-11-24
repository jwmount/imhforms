class CreateDevelopmentalLevels < ActiveRecord::Migration
  def change
    create_table :developmental_levels do |t|
      t.string :student_id
      t.date   :observed_on, default: '2003-01-01 00:00:00', null: false
      t.string :recorder
      
      t.boolean :fba_not_present, default: false
      t.boolean :fba_fleeting,    default: false
      t.boolean :fba_constricted, default: false
      t.boolean :fba_stable,      default: false

      t.boolean :ibc_not_present, default: false
      t.boolean :ibc_fleeting,    default: false
      t.boolean :ibc_constricted, default: false
      t.boolean :ibc_stable,      default: false
      
      t.boolean :sm_not_present, default: false
      t.boolean :sm_fleeting,    default: false
      t.boolean :sm_constricted, default: false
      t.boolean :sm_stable,      default: false

      t.boolean :p_not_present, default: false
      t.boolean :p_fleeting,    default: false
      t.boolean :p_constricted, default: false
      t.boolean :p_stable,      default: false

      t.boolean :d_not_present, default: false
      t.boolean :d_fleeting,    default: false
      t.boolean :d_constricted, default: false
      t.boolean :d_stable,      default: false

      t.boolean :wo_not_present, default: false
      t.boolean :wo_fleeting,    default: false
      t.boolean :wo_constricted, default: false
      t.boolean :wo_stable,      default: false

      t.integer :duration

      t.timestamps
    end
  end
end
