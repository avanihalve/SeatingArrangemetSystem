class Employee < ApplicationRecord
	  has_one_attached :avatar
	  belongs_to :seat
	  belongs_to :user

      validates :office_id, uniqueness: { message: "This Employee office_id has already been registered."   }, presence: true   
   
      validates :seat_id, uniqueness: { message: "This Employee has already been registered."   }   
end
