class EmpresasController < ApplicationController
  before_action :set_empresa, only: %i[ show update destroy show_logomarca]

  # GET /empresas
  def index
    @empresas = Empresa.all

    render json: @empresas
  end

  def show_logomarca
    if @empresa.nil?
      Rails.logger.error("Empresa não encontrada para o ID #{params[:id]}")
      render json: { error: "Empresa não encontrada" }, status: :not_found
    elsif @empresa.logomarca.attached?
      redirect_to rails_blob_path(@empresa.logomarca, disposition: "attachment")
    else
      Rails.logger.error("Logomarca não encontrada para a empresa com ID #{params[:id]}")
      render json: { error: "Logomarca não encontrada para a empresa" }, status: :not_found
    end
  end

  # GET /empresas/1
  def show
    render json: @empresa
  end

  # POST /empresas
  def create
    @empresa = Empresa.new(empresa_params)
    @empresa.logomarca.attach(params[:empresa][:logomarca])

    if @empresa.save
      render json: @empresa, status: :created, location: @empresa
    else
      render json: @empresa.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /empresas/1
  def update
    if @empresa.update(empresa_params)
      @empresa.logomarca.attach(params[:empresa][:logomarca]) if params[:empresa][:logomarca]
      render json: @empresa
    else
      render json: @empresa.errors, status: :unprocessable_entity
    end
  end

  # DELETE /empresas/1
  def destroy
    @empresa.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
      def set_empresa
      @empresa = Empresa.find_by(id: params[:id])
    
      unless @empresa
        render json: { error: "Empresa não encontrada" }, status: :not_found
      end
    end

    # Only allow a list of trusted parameters through.
    def empresa_params
      params.require(:empresa).permit(:cnpj, :razaoSocial, :nomeFantasia, :contato, :sala, :andar, :logomarca)
    end
end
