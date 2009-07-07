require 'test_helper'

class Admin::EntriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entries)
  end

  test "should show entry" do
    get :show, :id => entries(:one).to_param
    assert_response :success
  end

  test "should get edit entry" do
    get :edit, :id => entries(:one).to_param
    assert_response :success
  end

  test "should update entry" do
    put :update, :id => entries(:one).to_param, :entry => {}
    assert_redirected_to admin_entry_path(assigns(:entry))
  end

  test "should destroy entry" do
    assert_difference('Entry.count', -1) do
      delete :destroy, :id => entries(:one).to_param
    end

    assert_redirected_to admin_entries_path
  end
end
