class AddReferencefromUserToMyThread < ActiveRecord::Migration
  def change
    add_column :my_threads, :user_id, :integer
  end
end
