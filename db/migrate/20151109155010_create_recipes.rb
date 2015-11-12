class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :summary
      t.text :description
      t.date :dtstart
      t.string :ip_class, default: "PUBLIC"

      t.timestamps null: false
    end
  end
end
