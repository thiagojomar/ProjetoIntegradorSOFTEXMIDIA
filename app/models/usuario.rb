class Usuario < ApplicationRecord
    validates :cpf, :nomeCompleto, :email, :nomeUsuario, :senha, :tipousuario, presence: true
end
