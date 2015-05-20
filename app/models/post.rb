class Post < ActiveRecord::Base

    #relationships
        has_many :comments, dependent: :destroy

    #validations
        validates :title, presence: true,
                      length: { minimum:3 }

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%")
  end
end
