class Chating < ActiveRecord::Base
     belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, :scope => :recipient_id

   scope :involving, -> (user) do
    where("chatings.sender_id =? OR chatings.recipient_id =?",user.id,user.id)
   end

  scope :between, -> (sender_id, recipient_id) do
    where("(chatings.sender_id = ? AND chatings.recipient_id =?) OR (chatings.sender_id = ? AND chatings.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  end
end
