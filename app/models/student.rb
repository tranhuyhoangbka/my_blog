class Student < ActiveRecord::Base
  validates :name, presence: true
  enum sex: {male: 0, female: 1}
end
