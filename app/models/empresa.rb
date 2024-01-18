class Empresa < ApplicationRecord
    has_one_attached :logomarca
    validates :cnpj, :razaoSocial, :nomeFantasia, :contato, presence: true
  end