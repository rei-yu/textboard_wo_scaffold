class CreateMyComments < ActiveRecord::Migration
  def change
    create_table :my_comments do |t|
      t.string :pen_name
      t.string :comment
      t.references :my_thread, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
