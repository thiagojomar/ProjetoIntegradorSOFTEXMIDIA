require "test_helper"

class EmpresasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empresa = empresas(:one)
  end

  test "should get index" do
    get empresas_url, as: :json
    assert_response :success
  end

  test "should create empresa" do
    assert_difference("Empresa.count") do
      post empresas_url, params: { empresa: { andar: @empresa.andar, cnpj: @empresa.cnpj, contato: @empresa.contato, nomeFantasia: @empresa.nomeFantasia, razaoSocial: @empresa.razaoSocial, sala: @empresa.sala } }, as: :json
    end

    assert_response :created
  end

  test "should show empresa" do
    get empresa_url(@empresa), as: :json
    assert_response :success
  end

  test "should update empresa" do
    patch empresa_url(@empresa), params: { empresa: { andar: @empresa.andar, cnpj: @empresa.cnpj, contato: @empresa.contato, nomeFantasia: @empresa.nomeFantasia, razaoSocial: @empresa.razaoSocial, sala: @empresa.sala } }, as: :json
    assert_response :success
  end

  test "should destroy empresa" do
    assert_difference("Empresa.count", -1) do
      delete empresa_url(@empresa), as: :json
    end

    assert_response :no_content
  end
end
