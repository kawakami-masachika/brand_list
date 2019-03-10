class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validates :name, presence: true , length{maximum 200}
  #validates :age, presence: true , numericality: true  
end
