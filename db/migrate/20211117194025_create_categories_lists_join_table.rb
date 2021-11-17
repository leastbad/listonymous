class CreateCategoriesListsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :categories, :lists do |t|
      # t.index [:category_id, :list_id]
      # t.index [:list_id, :category_id]
    end
  end
end
