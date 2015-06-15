require 'test_helper'

class LogPostsControllerTest < ActionController::TestCase
  setup do
    @log_post = log_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:log_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create log_post" do
    assert_difference('LogPost.count') do
      post :create, log_post: { body: @log_post.body, title: @log_post.title, user_id: @log_post.user_id }
    end

    assert_redirected_to log_post_path(assigns(:log_post))
  end

  test "should show log_post" do
    get :show, id: @log_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @log_post
    assert_response :success
  end

  test "should update log_post" do
    patch :update, id: @log_post, log_post: { body: @log_post.body, title: @log_post.title, user_id: @log_post.user_id }
    assert_redirected_to log_post_path(assigns(:log_post))
  end

  test "should destroy log_post" do
    assert_difference('LogPost.count', -1) do
      delete :destroy, id: @log_post
    end

    assert_redirected_to log_posts_path
  end
end
