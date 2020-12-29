# frozen_string_literal: true

class CreateOpinions < ActiveRecord::Migration[6.0]
  def change
    create_table :opinions do |t|
      t.integer :user_id
      t.text :feedback

      t.timestamps
    end

    add_index :opinions, :user_id
  end
end
