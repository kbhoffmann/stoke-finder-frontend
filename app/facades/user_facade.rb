class UserFacade
  def self.all_users
    json = UserService.all_users

    json[:data].map do |user|
      User.new(user)
    end
  end

  def self.user_info(user_id)
    json = UserService.user_info(user_id)
    User.new(json[:data])
  end

  def self.user_create(user_params)
    UserService.user_create(user_params)
  end

  def self.user_update(user_params, session_user_id)
    UserService.user_update(user_params, session_user_id)
  end

  def self.user_delete(session_user_id)
    UserService.user_delete(session_user_id)
  end

  # def self.user_adventures(user_id)
  #   json = UserService.user_adventures(user_id)
  #   json[:data].map do |adventure|
  #     Adventure.new(adventure)
  #   end
  # end
end
