class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :url
      t.boolean :banned, default: false
      t.string :content_type
      t.string :image
      t.datetime :posted_at

      t.timestamps
    end
  end
end
