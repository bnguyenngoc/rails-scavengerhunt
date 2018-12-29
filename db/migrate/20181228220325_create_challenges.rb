class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :description
      t.text :judgenote
      t.integer :score
      t.string :keyword
      t.boolean :published, :default => true
      t.timestamps
    end
  end
end
