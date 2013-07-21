class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable
  
  attr_accessible :provider, :uid, :email, :password, :name
  
  has_many :moons
  
  def self.find_for_braveid_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid.to_s).first
    unless user
      user = User.create(
        provider:auth.provider,
        uid:auth.uid.to_s,
        email:auth.info.email,
        name:auth.info.characters.first,
        password:Devise.friendly_token[0,20]
        )
    end
    user
  end
end
