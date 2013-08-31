json.array!(@activities) do |activity|
  json.extract! activity, :name, :creator_id
  json.url activity_url(activity, format: :json)
end
