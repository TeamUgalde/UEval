require 'test_helper'

class CourseEvaluationsControllerTest < ActionController::TestCase
  setup do
    @course_evaluation = course_evaluations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_evaluations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_evaluation" do
    assert_difference('CourseEvaluation.count') do
      post :create, course_evaluation: { difficulty: @course_evaluation.difficulty }
    end

    assert_redirected_to course_evaluation_path(assigns(:course_evaluation))
  end

  test "should show course_evaluation" do
    get :show, id: @course_evaluation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_evaluation
    assert_response :success
  end

  test "should update course_evaluation" do
    patch :update, id: @course_evaluation, course_evaluation: { difficulty: @course_evaluation.difficulty }
    assert_redirected_to course_evaluation_path(assigns(:course_evaluation))
  end

  test "should destroy course_evaluation" do
    assert_difference('CourseEvaluation.count', -1) do
      delete :destroy, id: @course_evaluation
    end

    assert_redirected_to course_evaluations_path
  end
end
