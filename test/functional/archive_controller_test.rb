require 'test_helper'

class ArchiveControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entries)
  end
end
