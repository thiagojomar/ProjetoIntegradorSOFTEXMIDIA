class ChangeColumnTypeInUsuario < ActiveRecord::Migration[7.1]
  def change
    change_column :usuarios, :cpf, :string
  end
end
