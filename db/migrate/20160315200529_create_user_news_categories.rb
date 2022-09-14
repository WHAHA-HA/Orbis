class CreateUserNewsCategories < ActiveRecord::Migration
  def change
    create_table :user_news_categories do |t|
      t.integer :user_id,              null: false, default: 0
      t.integer :news_category_id,       null: false, default: 0
    end
  end
end
