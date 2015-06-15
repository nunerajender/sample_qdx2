json.array!(@pics) do |pic|
  json.extract! pic, :id, :name, :date
  json.url pic_url(pic, format: :json)
end
