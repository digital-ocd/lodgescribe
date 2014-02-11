json.array!(@accounts_users) do |accounts_user|
  json.extract! accounts_user, :id
  json.url accounts_user_url(accounts_user, format: :json)
end
