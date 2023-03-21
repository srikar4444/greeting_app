class User < ApplicationRecord
  has_many: clocked_times, dependent: :destroy
end
