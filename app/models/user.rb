class User < ApplicationRecord
  attr_accessor :remember_token
  before_save   :downcase_email
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, 
            presence: true, 
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def remember
    # actualiza atributo en base de datos generando un nuevo token
    update_attribute(:remember_digest, create_remember_token)    
  end
  
  def forget
    # actualiza atributo en base de datos a nulo 
    update_attribute(:remember_digest, nil)
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  private
    # Converts email to all lower-case.
    def downcase_email
      self.email.downcase!
    end
    # Returns the hash digest of the given string.
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  
    # Returns a random token.
    def User.new_token
      SecureRandom.urlsafe_base64
    end

    def create_remember_token
      self.remember_token = User.new_token
      self.remember_digest = User.digest(remember_token)
    end
    
end
