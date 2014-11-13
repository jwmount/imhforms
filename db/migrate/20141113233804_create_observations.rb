class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.string :student_id
      t.datetime :date_on
      t.string :name
      t.datetime :birthdate
      t.string :grade
      t.string :teacher
      t.string :allergies
      t.string :diet
      t.string :sleep
      t.string :elimination
      t.string :concerns
      t.string :stability
      t.string :parent_histories
      t.string :household_members
      t.string :community_supports
      t.string :interaction_patterns
      t.string :well_attuned
      t.string :avoidant
      t.string :vigilant
      t.string :over_stimulating
      t.string :sensory_registration
      t.string :sensory_orientation
      t.string :sensory_interpretation
      t.string :response_organization
      t.string :response_execution
      t.string :adaptability
      t.string :sensory_threshold
      t.string :sensory_seeking_behaviors
      t.string :shares_attention
      t.string :regulation
      t.string :engagement
      t.string :interactions
      t.string :individuation
      t.string :mood
      t.string :solves_problems
      t.string :imagination
      t.string :creativity
      t.string :reasoning
      t.string :links_emotions
      t.string :perspective
      t.string :multiCausal_thinking
      t.string :selfReflective_thinking

      t.timestamps
    end
  end
end
