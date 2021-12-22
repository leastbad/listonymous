class AddNumberOfViewersToList < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :viewer_count, :integer
  end
end
