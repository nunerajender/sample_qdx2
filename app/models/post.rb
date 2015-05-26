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
def self.import(file)

#sheetsheet = Roo::Spreadsheet.open(file.path)
spreadsheet = open_spreadsheet(file)
header = spreadsheet.row(1)
(2..spreadsheet.last_row).each do |i|
row = Hash[[header, spreadsheet.row(i)].transpose]
post = find_by_id(row["id"]) || new
post.attributes = row.to_hash.slice(*row.to_hash.keys)
p post.attributes
p"==========================="
post.save!
end
end
def self.open_spreadsheet(file)
case File.extname(file.original_filename)
when '.csv' then Roo::CSV.new(file.path, nil, :ignore)
when '.xls' then Roo::Excel.new(file.path)
#Roo::Excelx.new(tempfile.path, )
when '.xlsx' then Roo::Excelx.new(file.path, file_warning: :ignore)
else raise "Unknown file type: #{file.original_filename}"
end
end

end
