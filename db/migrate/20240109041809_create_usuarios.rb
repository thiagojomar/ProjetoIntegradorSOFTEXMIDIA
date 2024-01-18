class CreateUsuarios < ActiveRecord::Migration[7.1]
  def change
    create_table :usuarios do |t|
      t.integer :cpf
      t.string :nomeCompleto
      t.string :email
      t.string :nomeUsuario
      t.string :senha
      t.string :tipousuario

      t.timestamps
    end
  end
end
