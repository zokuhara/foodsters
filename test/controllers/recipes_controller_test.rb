require "test_helper"

class RecipesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

  def test_show
    get :show
    assert_response :success
  end

  def test_search
    get :search
    assert_response :success
  end

end
