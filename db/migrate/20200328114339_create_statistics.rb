class CreateStatistics < ActiveRecord::Migration[6.0]
  def change
    create_table :statistics do |t|
      t.references :shortener, null: false, foreign_key: true
      t.inet :ip_address

      t.timestamps
    end
  end
end
