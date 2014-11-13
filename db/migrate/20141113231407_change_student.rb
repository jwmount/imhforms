class ChangeStudent < ActiveRecord::Migration
  change_table :students do |t|
  	t.remove :observation
  	t.rename :birthdate, :born_on

    t.remove   :grade
    t.remove   :teacher
    t.remove   :allergies
    t.remove   :diet
    t.remove   :sleep
    t.remove   :elimination
    t.remove   :concerns
    t.remove   :stability
    t.remove   :parent_histories
    t.remove   :household_members
    t.remove   :community_supports
    t.remove   :interaction_patterns
    t.remove   :well_attuned
    t.remove   :avoidant
    t.remove   :vigilant
    t.remove   :over_stimulating
    t.remove   :sensory_registration
    t.remove   :sensory_orientation
    t.remove   :sensory_interpretation
    t.remove   :response_organization
    t.remove   :response_execution
    t.remove   :adaptability
    t.remove   :sensory_threshold
    t.remove   :sensory_seeking_behaviors
    t.remove   :shares_attention
    t.remove   :regulation
    t.remove   :engagement
    t.remove   :interactions
    t.remove   :individuation
    t.remove   :mood
    t.remove   :solves_problems
    t.remove   :imagination
    t.remove   :creativity
    t.remove   :reasoning
    t.remove   :links_emotions
    t.remove   :perspective
    t.remove   :multiCausal_thinking
    t.remove   :selfReflective_thinking
  end  
end
