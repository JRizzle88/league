json.array!(@champions) do |champion|
  json.extract! champion, :id
  json.url champion_url(champion, format: :json)
end
