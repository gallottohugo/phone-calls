class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         # calls_received
  # 
  has_many :calls_made, :class_name => 'Call', :foreign_key => 'user_sender_id'
  has_many :calls_received, :class_name => 'Call', :foreign_key => 'user_receiver_id'
end
