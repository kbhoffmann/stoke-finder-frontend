class User
  attr_reader :id, :user_name, :email, :street_address, :city, :state, :zipcode, :activity_preferences, :latitude, :longitude

  def initialize(data)
    @id = data[:id]
    @user_name = data[:attributes][:user_name]
    @email = data[:attributes][:email]
    @street_address = data[:attributes][:street_address]
    @city = data[:attributes][:city]
    @state = data[:attributes][:state]
    @zipcode = data[:attributes][:zipcode]
    @activity_preferences = data[:attributes][:activity_preferences]
    @latitude = data[:attributes][:latitude]
    @longitude = data[:attributes][:longitude]
  end
end
