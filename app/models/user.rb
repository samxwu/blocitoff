class User < ActiveRecord::Base
  has_many :items, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  before_save { self.email = email.downcase if email.present? }       
  
  #Validations
  validates :password, presence: true, length: { minimum: 7 }
  validates :password, length: { minimum: 7 }, allow_blank: true
  
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 7, maximum: 254 }
  
  
  def avatar_url(size)
        gravatar_id = Digest::MD5::hexdigest(self.email).downcase
        "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
    
end
