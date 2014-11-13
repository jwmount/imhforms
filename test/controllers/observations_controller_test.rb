require 'test_helper'

class ObservationsControllerTest < ActionController::TestCase
  setup do
    @observation = observations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:observations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create observation" do
    assert_difference('Observation.count') do
      post :create, observation: { adaptability: @observation.adaptability, allergies: @observation.allergies, avoidant: @observation.avoidant, birthdate: @observation.birthdate, community_supports: @observation.community_supports, concerns: @observation.concerns, creativity: @observation.creativity, date_on: @observation.date_on, diet: @observation.diet, elimination: @observation.elimination, engagement: @observation.engagement, grade: @observation.grade, household_members: @observation.household_members, imagination: @observation.imagination, individuation: @observation.individuation, interaction_patterns: @observation.interaction_patterns, interactions: @observation.interactions, links_emotions: @observation.links_emotions, mood: @observation.mood, multiCausal_thinking: @observation.multiCausal_thinking, name: @observation.name, over_stimulating: @observation.over_stimulating, parent_histories: @observation.parent_histories, perspective: @observation.perspective, reasoning: @observation.reasoning, regulation: @observation.regulation, response_execution: @observation.response_execution, response_organization: @observation.response_organization, selfReflective_thinking: @observation.selfReflective_thinking, sensory_interpretation: @observation.sensory_interpretation, sensory_orientation: @observation.sensory_orientation, sensory_registration: @observation.sensory_registration, sensory_seeking_behaviors: @observation.sensory_seeking_behaviors, sensory_threshold: @observation.sensory_threshold, shares_attention: @observation.shares_attention, sleep: @observation.sleep, solves_problems: @observation.solves_problems, stability: @observation.stability, student_id: @observation.student_id, teacher: @observation.teacher, vigilant: @observation.vigilant, well_attuned: @observation.well_attuned }
    end

    assert_redirected_to observation_path(assigns(:observation))
  end

  test "should show observation" do
    get :show, id: @observation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @observation
    assert_response :success
  end

  test "should update observation" do
    patch :update, id: @observation, observation: { adaptability: @observation.adaptability, allergies: @observation.allergies, avoidant: @observation.avoidant, birthdate: @observation.birthdate, community_supports: @observation.community_supports, concerns: @observation.concerns, creativity: @observation.creativity, date_on: @observation.date_on, diet: @observation.diet, elimination: @observation.elimination, engagement: @observation.engagement, grade: @observation.grade, household_members: @observation.household_members, imagination: @observation.imagination, individuation: @observation.individuation, interaction_patterns: @observation.interaction_patterns, interactions: @observation.interactions, links_emotions: @observation.links_emotions, mood: @observation.mood, multiCausal_thinking: @observation.multiCausal_thinking, name: @observation.name, over_stimulating: @observation.over_stimulating, parent_histories: @observation.parent_histories, perspective: @observation.perspective, reasoning: @observation.reasoning, regulation: @observation.regulation, response_execution: @observation.response_execution, response_organization: @observation.response_organization, selfReflective_thinking: @observation.selfReflective_thinking, sensory_interpretation: @observation.sensory_interpretation, sensory_orientation: @observation.sensory_orientation, sensory_registration: @observation.sensory_registration, sensory_seeking_behaviors: @observation.sensory_seeking_behaviors, sensory_threshold: @observation.sensory_threshold, shares_attention: @observation.shares_attention, sleep: @observation.sleep, solves_problems: @observation.solves_problems, stability: @observation.stability, student_id: @observation.student_id, teacher: @observation.teacher, vigilant: @observation.vigilant, well_attuned: @observation.well_attuned }
    assert_redirected_to observation_path(assigns(:observation))
  end

  test "should destroy observation" do
    assert_difference('Observation.count', -1) do
      delete :destroy, id: @observation
    end

    assert_redirected_to observations_path
  end
end
