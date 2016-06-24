class CreateFourpdaParsers < ActiveRecord::Migration
  def change
    create_table :fourpda_parsers do |t|

      t.timestamps null: false
    end
  end
end
