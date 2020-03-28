class CreateShorteners < ActiveRecord::Migration[6.0]
  def change
    create_table :shorteners do |t|
      t.string :url
      t.string :code

      t.timestamps
    end
  end
end
