class MyComment < ActiveRecord::Base
  belongs_to :my_thread
  belongs_to :user
end
