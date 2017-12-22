class Appointment < ActiveRecord::Base
    belongs_to :user
    validates :user_id, presence: true
    validates :date, presence: true
end
