require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { adaptability: @student.adaptability, allergies: @student.allergies, avoidant: @student.avoidant, birthdate: @student.birthdate, community_supports: @student.community_supports, concerns: @student.concerns, creativity: @student.creativity, diet: @student.diet, elimination: @student.elimination, engagement: @student.engagement, grade: @student.grade, household_members: @student.household_members, imagination: @student.imagination, individuation: @student.individuation, interaction_patterns: @student.interaction_patterns, interactions: @student.interactions, links_emotions: @student.links_emotions, mood: @student.mood, multiCausal_thinking: @student.multiCausal_thinking, name: @student.name, over_stimulating: @student.over_stimulating, parent_histories: @student.parent_histories, perspective: @student.perspective, reasoning: @student.reasoning, regulation: @student.regulation, response_execution: @student.response_execution, response_organization: @student.response_organization, selfReflective_thinking: @student.selfReflective_thinking, sensory_interpretation: @student.sensory_interpretation, sensory_orientation: @student.sensory_orientation, sensory_registration: @student.sensory_registration, sensory_seeking_behaviors: @student.sensory_seeking_behaviors, sensory_threshold: @student.sensory_threshold, shares_attention: @student.shares_attention, sleep: @student.sleep, solves_problems: @student.solves_problems, stability: @student.stability, teacher: @student.teacher, vigilant: @student.vigilant, well_attuned: @student.well_attuned }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { adaptability: @student.adaptability, allergies: @student.allergies, avoidant: @student.avoidant, birthdate: @student.birthdate, community_supports: @student.community_supports, concerns: @student.concerns, creativity: @student.creativity, diet: @student.diet, elimination: @student.elimination, engagement: @student.engagement, grade: @student.grade, household_members: @student.household_members, imagination: @student.imagination, individuation: @student.individuation, interaction_patterns: @student.interaction_patterns, interactions: @student.interactions, links_emotions: @student.links_emotions, mood: @student.mood, multiCausal_thinking: @student.multiCausal_thinking, name: @student.name, over_stimulating: @student.over_stimulating, parent_histories: @student.parent_histories, perspective: @student.perspective, reasoning: @student.reasoning, regulation: @student.regulation, response_execution: @student.response_execution, response_organization: @student.response_organization, selfReflective_thinking: @student.selfReflective_thinking, sensory_interpretation: @student.sensory_interpretation, sensory_orientation: @student.sensory_orientation, sensory_registration: @student.sensory_registration, sensory_seeking_behaviors: @student.sensory_seeking_behaviors, sensory_threshold: @student.sensory_threshold, shares_attention: @student.shares_attention, sleep: @student.sleep, solves_problems: @student.solves_problems, stability: @student.stability, teacher: @student.teacher, vigilant: @student.vigilant, well_attuned: @student.well_attuned }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
