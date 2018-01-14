class User < ApplicationRecord
  extend FriendlyId
  attr_accessor :login
  
  friendly_id :username
  searchkick

  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship', dependent: :destroy, foreign_key: 'follower_id'
  has_many :passive_relationships, class_name: 'Relationship', dependent: :destroy, foreign_key: 'following_id'
  has_many :followings, through: :active_relationships, source: :following
  has_many :followers, through: :passive_relationships, source: :follower
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validations
  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validate :validate_username

  def follow(user)
    active_relationships.create(following_id: user.id)
  end

  def unfollow(user)
    active_relationships.find_by(following_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  def follows
    active_relationships.find_by(follower_id: current_user.id)
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
  
  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
end
