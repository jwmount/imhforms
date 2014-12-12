class CreateDevelopmentalLevels < ActiveRecord::Migration
  def change
    create_table :developmental_levels do |t|
      t.string :student_id
      t.date   :observed_on, default: '2003-01-01 00:00:00', null: false
      t.string :recorder

      # Facilitated By Adult, in developmental_levels/developmental_level_options
      #   no selcection   = 0
      #   not present     = 1
      #   fleeting        = 2
      #   constricted     = 3
      #   stable          = 4
      t.integer :facilitated_by_adult, default: 0      
      t.integer :initiated_by_child,   default: 0
      t.integer :sensory_motor,        default: 0
      t.integer :pleasure,             default: 0
      t.integer :displeasure,          default: 0
      t.integer :with_object,          default: 0

      t.integer :duration

      t.timestamps
    end
  end
end
