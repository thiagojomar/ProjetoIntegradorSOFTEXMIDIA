class MidiaController < ApplicationController
  before_action :set_midia, only: %i[ show update destroy show_arquivo ]

  # GET /midia
  def index
    @midia = Midia.all

    render json: @midia
  end

  def show_arquivo
    if @midia.nil?
      Rails.logger.error("midia não encontrada para o ID #{params[:id]}")
      render json: { error: "midia não encontrada" }, status: :not_found
    elsif @midia.arquivo.attached?
      redirect_to rails_blob_path(@midia.arquivo, disposition: "attachment")
    else
      Rails.logger.error("Arquivo não encontrada para a midia com ID #{params[:id]}")
      render json: { error: "Arquivo não encontrada para a midia" }, status: :not_found
    end
  end

  # def show_arquivo
  #   if @midia.nil?
  #     Rails.logger.error("Midia não encontrada para o ID #{params[:id]}")
  #     render json: { error: "Midia não encontrada" }, status: :not_found
  #   elsif @midia.arquivo.attached?
  #     render json: { arquivo_url: rails_blob_path(@midia.arquivo, disposition: "attachment") }
  #   else
  #     Rails.logger.error("Arquivo não encontrada para a Midia com ID #{params[:id]}")
  #     render json: { error: "Arquivo não encontrada para a Midia" }, status: :not_found
  #   end
  # end

  # GET /midia/1
  def show
    render json: @midia
  end

  # POST /midia
  def create
    @midia = Midia.new(midia_params)
    @midia.arquivo.attach(params[:midia][:arquivo])

    if @midia.save
      render json: @midia, status: :created, location: @midia
    else
      render json: @midia.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /midia/1
  def update
    if @midia.update(midia_params)
      @midia.arquivo.attach(params[:midia][:arquivo]) if params[:midia][:arquivo]
      render json: @midia
    else
      render json: @midia.errors, status: :unprocessable_entity
    end
  end

  # DELETE /midia/1
  def destroy
    if @midia.destroy
      render json: { message: "Midia excluída com sucesso" }
    else
      render json: { error: "Falha ao excluir a Midia" }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_midia
      @midia = Midia.find_by(id: params[:id])
    
      unless @midia
        render json: { error: "Midia não encontrada" }, status: :not_found
      end
    end

    # Only allow a list of trusted parameters through.
    def midia_params
      params.require(:midia).permit(:titulo, :descricao, :tipoMidia, :inicioExibicao, :terminoExibicao)
    end
end
