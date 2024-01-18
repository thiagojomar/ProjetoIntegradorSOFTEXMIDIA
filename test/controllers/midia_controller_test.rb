require "test_helper"

class MidiaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @midium = midia(:one)
  end

  test "should get index" do
    get midia_url, as: :json
    assert_response :success
  end

  test "should create midium" do
    assert_difference("Midium.count") do
      post midia_url, params: { midium: { descricao: @midium.descricao, inicioExibicao: @midium.inicioExibicao, terminoExibicao: @midium.terminoExibicao, tipoMidia: @midium.tipoMidia, titulo: @midium.titulo } }, as: :json
    end

    assert_response :created
  end

  test "should show midium" do
    get midium_url(@midium), as: :json
    assert_response :success
  end

  test "should update midium" do
    patch midium_url(@midium), params: { midium: { descricao: @midium.descricao, inicioExibicao: @midium.inicioExibicao, terminoExibicao: @midium.terminoExibicao, tipoMidia: @midium.tipoMidia, titulo: @midium.titulo } }, as: :json
    assert_response :success
  end

  test "should destroy midium" do
    assert_difference("Midium.count", -1) do
      delete midium_url(@midium), as: :json
    end

    assert_response :no_content
  end
end
