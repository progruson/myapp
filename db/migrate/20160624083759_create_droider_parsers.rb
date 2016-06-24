class CreateDroiderParsers < ActiveRecord::Migration
  def change
    create_table :droider_parsers do |t|

      t.timestamps null: false
    end
  end
end
