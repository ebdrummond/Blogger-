class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |table|

      table.string :title
      table.text :body
      table.timestamps
    end
  end
end
