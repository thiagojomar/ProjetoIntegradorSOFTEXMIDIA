class Midia < ApplicationRecord
    has_one_attached :arquivo
    validates :titulo, :descricao, :tipoMidia, :inicioExibicao, :terminoExibicao, presence: true
end
