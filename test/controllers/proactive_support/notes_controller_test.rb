require 'test_helper'

module ProactiveSupport
  class NotesControllerTest < ActionController::TestCase
    setup do
      @note = proactive_support_notes(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:notes)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create note" do
      assert_difference('Note.count') do
        post :create, note: { is_active: @note.is_active, level: @note.level, message: @note.message, tags: @note.tags, user_id: @note.user_id }
      end

      assert_redirected_to note_path(assigns(:note))
    end

    test "should show note" do
      get :show, id: @note
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @note
      assert_response :success
    end

    test "should update note" do
      patch :update, id: @note, note: { is_active: @note.is_active, level: @note.level, message: @note.message, tags: @note.tags, user_id: @note.user_id }
      assert_redirected_to note_path(assigns(:note))
    end

    test "should destroy note" do
      assert_difference('Note.count', -1) do
        delete :destroy, id: @note
      end

      assert_redirected_to notes_path
    end
  end
end
