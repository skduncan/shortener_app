class CreateShortlinks < ActiveRecord::Migration[5.1]
  def change
    create_table :shortlinks do |t|
      t.string :shorturl
      t.string :longurl

      t.timestamps
    end
  end
end
