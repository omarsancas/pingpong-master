class CreateElos < ActiveRecord::Migration
  def change
    create_table :elos do |t|

      t.timestamps null: false
    end
  end
end
