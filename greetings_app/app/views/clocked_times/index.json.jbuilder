json.clocked_times @clocked_times do |c_time|
  json.id c_time.id
  json.time c_time.time.strftime("%Y-%m-%d %I:%M%p")
  json.user_id c_time.user_id
  json.created_at c_time.created_at
  json.updated_at c_time.updated_at
end
