class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.text :tagline
      t.text :url
      t.references :captain, index: true, foreign_key: {to_table: :users}
      t.integer :score

      t.timestamps
    end
  end
end
