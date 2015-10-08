class AddReferencefromUserToMyComment < ActiveRecord::Migration
  def change
    add_column :my_comments, :user_id, :integer
  end
end
