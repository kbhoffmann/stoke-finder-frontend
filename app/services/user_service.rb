class UserService
  def self.all_users
    response = conn.get("/api/v1/users")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.user_info(user_id)
    response = conn.get("/api/v1/users/#{user_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  # def self.user_adventures(user_id)
  #   response = conn.get("/api/v1/users/#{user_id}/adventures")
  #   JSON.parse(response.body, symbolize_names: true)
  # end

  def self.conn
    Faraday.new("http://localhost:3000")
  end
end
