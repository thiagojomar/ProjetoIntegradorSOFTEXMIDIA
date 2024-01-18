class CreateEmpresas < ActiveRecord::Migration[7.1]
  def change
    create_table :empresas do |t|
      t.integer :cnpj
      t.string :razaoSocial
      t.string :nomeFantasia
      t.string :contato
      t.string :sala
      t.string :andar

      t.timestamps
    end
  end
end
