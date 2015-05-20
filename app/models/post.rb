class Post < ActiveRecord::Base

    #relationships
        has_many :comments, dependent: :destroy

    #validations
        validates :title, presence: true,
                      length: { minimum:3 }



def self.search(search)
  if search
    Post.where('title LIKE ?', "%#{search}%")
        else
            Post.all
  end
end


end
