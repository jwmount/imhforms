json.array!(@observations) do |observation|
  json.extract! observation, :id, :student_id, :date_on, :name, :birthdate, :grade, :teacher, :allergies, :diet, :sleep, :elimination, :concerns, :stability, :parent_histories, :household_members, :community_supports, :interaction_patterns, :well_attuned, :avoidant, :vigilant, :over_stimulating, :sensory_registration, :sensory_orientation, :sensory_interpretation, :response_organization, :response_execution, :adaptability, :sensory_threshold, :sensory_seeking_behaviors, :shares_attention, :regulation, :engagement, :interactions, :individuation, :mood, :solves_problems, :imagination, :creativity, :reasoning, :links_emotions, :perspective, :multiCausal_thinking, :selfReflective_thinking
  json.url observation_url(observation, format: :json)
end
