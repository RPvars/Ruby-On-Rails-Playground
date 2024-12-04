class User < ApplicationRecord
  has_many :qualifications, dependent: :destroy
  has_many :availabilities, dependent: :destroy
end