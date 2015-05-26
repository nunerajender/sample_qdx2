class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable    #, :confirmable

has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    #has_attached_file :avatar, :styles => { :medium => "300*300>", :tumb => "100*100#"}
          #has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }

          #---------------------------****  relationships  ***--------#

   has_many :follows
 has_many :conversations, :foreign_key => :sender_id


    has_many :relationships, foreign_key: "follower_id", dependent: :destroy

  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower







#----------------------------------------
  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end
#---------------------------------

 acts_as_messageable

def mailboxer_name
self.name
end

def mailboxer_email(object)
self.email
end




end
