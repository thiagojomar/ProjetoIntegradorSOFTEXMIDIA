require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { 20: @user.20, 5: @user.5, 50: @user.50, 99: @user.99, char: @user.char, cpf: @user.cpf, email: @user.email, integer: @user.integer, nome_completo: @user.nome_completo, nome_usuario: @user.nome_usuario, tipo_usuario: @user.tipo_usuario, varchar: @user.varchar } }, as: :json
    end

    assert_response :created
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { 20: @user.20, 5: @user.5, 50: @user.50, 99: @user.99, char: @user.char, cpf: @user.cpf, email: @user.email, integer: @user.integer, nome_completo: @user.nome_completo, nome_usuario: @user.nome_usuario, tipo_usuario: @user.tipo_usuario, varchar: @user.varchar } }, as: :json
    assert_response :success
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user), as: :json
    end

    assert_response :no_content
  end
end
