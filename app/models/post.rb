class Post < ActiveRecord::Base

    #relationships
        has_many :comments, dependent: :destroy

    #validations
        validates :title, presence: true,
                      length: { minimum:3 }


end
