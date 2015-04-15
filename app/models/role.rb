class Role < ActiveRecord::Base
  attr_accessible :name
  has_many :users, select: 'id, username, email, role_id, password_reset_token, password_reset_sent_at'
  validates :name, presence: true, uniqueness: true, length: { minimum: 4 }
end
