class User < ApplicationRecord
  has_many :clocked_times, dependent: :destroy
  has_many :followers
end
