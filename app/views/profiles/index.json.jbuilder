json.array!(@profiles) do |profile|
  json.extract! profile, :id, :fname, :lname, :email, :phone_no, :home_city
  json.url profile_url(profile, format: :json)
end
