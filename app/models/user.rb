# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  attr_accessor :remember_token
  before_save :downcase_email
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def remember
    update_attribute(:remember_digest, create_remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password?(token)
  end

  # Returns a random token.
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private

  # Converts email to all lower-case.
  def downcase_email
    email.downcase!
  end

  def create_remember_token
    self.remember_token = User.new_token
    self.remember_digest = User.digest(remember_token)
  end
end
