require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get host" do
    get :host
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get g+" do
    get :g+
    assert_response :success
  end

  test "should get fb" do
    get :fb
    assert_response :success
  end

  test "should get twitter" do
    get :twitter
    assert_response :success
  end

  test "should get in" do
    get :in
    assert_response :success
  end

end
