class Box < ActiveRecord::Base
  attr_accessible :box_number, :count_docs
  has_many :documents
  validates :box_number, presence: true, uniqueness: true, length: { maximum: 9 }
end
