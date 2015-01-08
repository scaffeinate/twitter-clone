class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, length: { maximum: 100 }
  validates :username, presence: true, length: { maximum: 20 }
end
