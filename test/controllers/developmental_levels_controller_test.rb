require 'test_helper'

class DevelopmentalLevelsControllerTest < ActionController::TestCase
  setup do
    @developmental_level = developmental_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:developmental_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create developmental_level" do
    assert_difference('DevelopmentalLevel.count') do
      post :create, developmental_level: { d_constricted,: @developmental_level.d_constricted,, d_fleeting,: @developmental_level.d_fleeting,, d_not_present,: @developmental_level.d_not_present,, d_stable,: @developmental_level.d_stable,, date: @developmental_level.date, fba_constricted,: @developmental_level.fba_constricted,, fba_fleeting,: @developmental_level.fba_fleeting,, fba_not_present,: @developmental_level.fba_not_present,, fba_stable,: @developmental_level.fba_stable,, ibc_constricted,: @developmental_level.ibc_constricted,, ibc_fleeting,: @developmental_level.ibc_fleeting,, ibc_not_present,: @developmental_level.ibc_not_present,, ibc_stable,: @developmental_level.ibc_stable,, p_constricted,: @developmental_level.p_constricted,, p_fleeting,: @developmental_level.p_fleeting,, p_not_present,: @developmental_level.p_not_present,, p_stable,: @developmental_level.p_stable,, recorder,: @developmental_level.recorder,, sm_constricted,: @developmental_level.sm_constricted,, sm_fleeting,: @developmental_level.sm_fleeting,, sm_not_present,: @developmental_level.sm_not_present,, sm_stable,: @developmental_level.sm_stable,, student,: @developmental_level.student,, time: @developmental_level.time, wo_constricted,: @developmental_level.wo_constricted,, wo_fleeting,: @developmental_level.wo_fleeting,, wo_not_present,: @developmental_level.wo_not_present,, wo_stable,: @developmental_level.wo_stable, }
    end

    assert_redirected_to developmental_level_path(assigns(:developmental_level))
  end

  test "should show developmental_level" do
    get :show, id: @developmental_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @developmental_level
    assert_response :success
  end

  test "should update developmental_level" do
    patch :update, id: @developmental_level, developmental_level: { d_constricted,: @developmental_level.d_constricted,, d_fleeting,: @developmental_level.d_fleeting,, d_not_present,: @developmental_level.d_not_present,, d_stable,: @developmental_level.d_stable,, date: @developmental_level.date, fba_constricted,: @developmental_level.fba_constricted,, fba_fleeting,: @developmental_level.fba_fleeting,, fba_not_present,: @developmental_level.fba_not_present,, fba_stable,: @developmental_level.fba_stable,, ibc_constricted,: @developmental_level.ibc_constricted,, ibc_fleeting,: @developmental_level.ibc_fleeting,, ibc_not_present,: @developmental_level.ibc_not_present,, ibc_stable,: @developmental_level.ibc_stable,, p_constricted,: @developmental_level.p_constricted,, p_fleeting,: @developmental_level.p_fleeting,, p_not_present,: @developmental_level.p_not_present,, p_stable,: @developmental_level.p_stable,, recorder,: @developmental_level.recorder,, sm_constricted,: @developmental_level.sm_constricted,, sm_fleeting,: @developmental_level.sm_fleeting,, sm_not_present,: @developmental_level.sm_not_present,, sm_stable,: @developmental_level.sm_stable,, student,: @developmental_level.student,, time: @developmental_level.time, wo_constricted,: @developmental_level.wo_constricted,, wo_fleeting,: @developmental_level.wo_fleeting,, wo_not_present,: @developmental_level.wo_not_present,, wo_stable,: @developmental_level.wo_stable, }
    assert_redirected_to developmental_level_path(assigns(:developmental_level))
  end

  test "should destroy developmental_level" do
    assert_difference('DevelopmentalLevel.count', -1) do
      delete :destroy, id: @developmental_level
    end

    assert_redirected_to developmental_levels_path
  end
end
