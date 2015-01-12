class CreateDevelopmentalLevels < ActiveRecord::Migration
  def change
    create_table :developmental_levels do |t|
      t.integer  :student_id
      t.date     :observed_on
      t.string   :recorder
      t.integer  :duration

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

      t.integer :sensory_motor_play,   default: 0
      t.integer :representational_play,default: 0
      t.integer :with_adult_support,   default: 0
      t.integer :independently,        default: 0

      t.integer :cross_context_1,      default: 0
      t.integer :cross_context_2,      default: 0
      t.integer :cross_context_3,      default: 0
      t.integer :cross_context_4,      default: 0

      t.timestamps
    end
  end
end
