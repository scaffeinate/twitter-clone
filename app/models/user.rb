class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  attr_accessor :login

  extend FriendlyId
  friendly_id :username, use: [:slugged, :finders]

  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, length: { maximum: 100 }
  validates :username, presence: true, length: { maximum: 20 }, :uniqueness => { case_sensitive: false }

  has_many :tweets

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, CoverUploader

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

end
