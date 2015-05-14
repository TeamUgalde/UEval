require 'test_helper'

class ProfessorEvaluationsControllerTest < ActionController::TestCase
  setup do
    @professor_evaluation = professor_evaluations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:professor_evaluations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create professor_evaluation" do
    assert_difference('ProfessorEvaluation.count') do
      post :create, professor_evaluation: { addresses_questions: @professor_evaluation.addresses_questions, arrival_puntuality: @professor_evaluation.arrival_puntuality, clearness: @professor_evaluation.clearness, course_name: @professor_evaluation.course_name, difficulty: @professor_evaluation.difficulty, feedback_puntuality: @professor_evaluation.feedback_puntuality, knowledge: @professor_evaluation.knowledge, learning_interest: @professor_evaluation.learning_interest, overall_score: @professor_evaluation.overall_score, respectful: @professor_evaluation.respectful }
    end

    assert_redirected_to professor_evaluation_path(assigns(:professor_evaluation))
  end

  test "should show professor_evaluation" do
    get :show, id: @professor_evaluation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @professor_evaluation
    assert_response :success
  end

  test "should update professor_evaluation" do
    patch :update, id: @professor_evaluation, professor_evaluation: { addresses_questions: @professor_evaluation.addresses_questions, arrival_puntuality: @professor_evaluation.arrival_puntuality, clearness: @professor_evaluation.clearness, course_name: @professor_evaluation.course_name, difficulty: @professor_evaluation.difficulty, feedback_puntuality: @professor_evaluation.feedback_puntuality, knowledge: @professor_evaluation.knowledge, learning_interest: @professor_evaluation.learning_interest, overall_score: @professor_evaluation.overall_score, respectful: @professor_evaluation.respectful }
    assert_redirected_to professor_evaluation_path(assigns(:professor_evaluation))
  end

  test "should destroy professor_evaluation" do
    assert_difference('ProfessorEvaluation.count', -1) do
      delete :destroy, id: @professor_evaluation
    end

    assert_redirected_to professor_evaluations_path
  end
end
