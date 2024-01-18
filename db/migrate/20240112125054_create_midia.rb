class CreateMidia < ActiveRecord::Migration[7.1]
  def change
    create_table :midia do |t|
      t.string :titulo
      t.string :descricao
      t.string :tipoMidia
      t.string :inicioExibicao
      t.string :terminoExibicao

      t.timestamps
    end
  end
end
