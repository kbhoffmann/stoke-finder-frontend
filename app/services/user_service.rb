class UserService
  def self.all_users
    response = conn.get("/api/v1/users")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.user_info(user_id)
    response = conn.get("/api/v1/users/#{user_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.user_create(attributes)
    response = conn.post("/api/v1/users", attributes.to_json, "CONTENT_TYPE" => "application/json")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.user_update(attributes, session_user_id)
    response = conn.patch("/api/v1/users/#{session_user_id}", attributes.to_json, "CONTENT_TYPE" => "application/json")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.user_delete(session_user_id)
   response = conn.delete("/api/v1/users/#{session_user_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.login_user(user_data)
    response = conn.get("/api/vi/sessions", user_data.to_json, "CONTENT_TYPE" => "application/json")
    JSON.parse(response.body, sybolize_names: true)
  end

  def self.oauth_find(user_data)
    #really unsure of this route...I think if we create a special, non-restful
    #action on the users controller, we can route to that, then keep the successful
    #creation route to this endpoint.
    #Ideas for non-restful endpoint: auth (similar to the endpoint on the FE side)
    #then have the auth action find_or_create_by(user_name:)
    response = conn.post("/api/vi/users", user_data.to_json, "CONTENT_TYPE" => "application/json")
    JSON.parse(response.body, sybolize_names: true)
  end

  # def self.user_adventures(user_id)
  #   response = conn.get("/api/v1/users/#{user_id}/adventures")
  #   JSON.parse(response.body, symbolize_names: true)
  # end

  def self.conn
    Faraday.new("https://arcane-sands-07034.herokuapp.com")
  end
end
