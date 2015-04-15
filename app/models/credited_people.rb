class CreditedPeople < ActiveRecord::Base
  attr_accessible :credit_number, :last_name, :mother_last_name, :name
end
