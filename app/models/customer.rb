class Customer < ApplicationRecord
  validates_uniqueness_of :email
  has_many :orders, :dependent => :destroy
end
