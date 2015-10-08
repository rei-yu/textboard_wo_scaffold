class MyThread < ActiveRecord::Base
	has_many :my_comments, :dependent => :delete_all
	belongs_to :user
end
