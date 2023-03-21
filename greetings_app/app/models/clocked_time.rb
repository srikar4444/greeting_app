class ClockedTime < ApplicationRecord
  ACTION_STATUS = ['sleep', 'awake']
  belongs_to :user
  validates :action, presence: true
  validates :action, inclusion: { in: ACTION_STATUS }
end
