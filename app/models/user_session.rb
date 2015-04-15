class UserSession < Authlogic::Session::Base
  # attr_accessible :title, :body
  consecutive_failed_logins_limit 5
  logout_on_timeout true # default if false
end
