class User < ActiveRecord::Base
  attr_accessible :username, :crypted_password, :password_salt, :email, :is_logged, :login_count, :failed_login_count, :role_id, :last_request_at, :current_login_at, :last_login_at, :current_login_ip, :last_login_ip, :password, :password_confirmation, :password_reset_token, :password_reset_sent_at, :perishable_token, :persistence_token, :single_access_token
  belongs_to :role, select: 'id, name'

  validates :username, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :role_id, numericality: { greater_than: 0 }

  acts_as_authentic do |c|
  	c.login_field = 'username'
    c.logged_in_timeout = 15.minutes # default is 10.minutes
  end # block optional

  def send_password_reset
  	generate_token(:password_reset_token)
  	self.password_reset_sent_at = Time.zone.now
  	save!
  	UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
