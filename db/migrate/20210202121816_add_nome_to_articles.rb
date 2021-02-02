class AddNomeToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :nome, :string
  end
end
