class User < ActiveRecord::Base
  has_many :created_groups, :foreign_key => 'user_id', :class_name => "Group"
  has_many :user_groups
  has_many :groups, through: :user_groups
end
