class User < ActiveRecord::Base
  validates :first_name, :last_name, :email_address, :password, :position, presence: true
  has_many :created_groups, :foreign_key => 'user_id', :class_name => "Group"
  has_many :user_groups
  has_many :groups, through: :user_groups
end
