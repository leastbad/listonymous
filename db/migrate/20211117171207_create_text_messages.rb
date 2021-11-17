class CreateTextMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :text_messages do |t|
      t.string :content
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
