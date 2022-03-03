require 'rails_helper'

RSpec.describe UserService do
  describe 'Methods' do
    it "#user_info", :vcr do

      response = UserService.user_info(1)

      expect(response).to be_a(Hash)

      user_data = response[:data]

      expect(user_data).to have_key(:id)
      expect(user_data[:id]).to be_an(String)

      expect(user_data[:attributes]).to have_key(:user_name)
      expect(user_data[:attributes][:user_name]).to be_an(String)

      expect(user_data[:attributes]).to have_key(:email)
      expect(user_data[:attributes][:email]).to be_an(String)

      expect(user_data[:attributes]).to have_key(:street_address)
      expect(user_data[:attributes][:street_address]).to be_an(String)

      expect(user_data[:attributes]).to have_key(:city)
      expect(user_data[:attributes][:city]).to be_an(String)

      expect(user_data[:attributes]).to have_key(:state)
      expect(user_data[:attributes][:state]).to be_an(String)

      expect(user_data[:attributes]).to have_key(:zipcode)
      expect(user_data[:attributes][:zipcode]).to be_an(String)

      expect(user_data[:attributes]).to have_key(:activity_preferences)
      expect(user_data[:attributes][:activity_preferences]).to be_an(String)

      expect(user_data[:attributes]).to have_key(:latitude)
      expect(user_data[:attributes][:latitude]).to be_an(Float)

      expect(user_data[:attributes]).to have_key(:longitude)
      expect(user_data[:attributes][:longitude]).to be_an(Float)
    end

    context '#login_user' do
      it 'returns user data', :vcr do
        params[:user_name] = "Bob_Barker"
        params[:password] = "123FakeStreet"
        user_data = {user: params[:user_name], password: params[:password]}

        response = UserFacade.login_user(user_data)

        expect(response).to be_a(Hash)
        user_data = response[:data]

        expect(user_data).to have_key(:id)
        expect(user_data[:id]).to be_an(String)

        expect(user_data[:attributes]).to have_key(:user_name)
        expect(user_data[:attributes][:user_name]).to be_an(String)

        expect(user_data[:attributes]).to have_key(:email)
        expect(user_data[:attributes][:email]).to be_an(String)

        expect(user_data[:attributes]).to have_key(:street_address)
        expect(user_data[:attributes][:street_address]).to be_an(String)

        expect(user_data[:attributes]).to have_key(:city)
        expect(user_data[:attributes][:city]).to be_an(String)

        expect(user_data[:attributes]).to have_key(:state)
        expect(user_data[:attributes][:state]).to be_an(String)

        expect(user_data[:attributes]).to have_key(:zipcode)
        expect(user_data[:attributes][:zipcode]).to be_an(String)

        expect(user_data[:attributes]).to have_key(:activity_preferences)
        expect(user_data[:attributes][:activity_preferences]).to be_an(String)

        expect(user_data[:attributes]).to have_key(:latitude)
        expect(user_data[:attributes][:latitude]).to be_an(Float)

        expect(user_data[:attributes]).to have_key(:longitude)
        expect(user_data[:attributes][:longitude]).to be_an(Float)
      end
    end

    context '::oauth_find' do
      it 'returns user data', :vcr do
        auto_hash = {'info' => {'email' => "beardbikesandbeers@gmail.com"} }
        user_data = {email: auth_hash['info']['email']}
        response = UserService.oauth_find(user_data)

        expect(response).to be_a(Hash)
        user_data = response[:data]

        expect(user_data).to have_key(:id)
        expect(user_data[:id]).to be_an(String)

        expect(user_data[:attributes]).to have_key(:user_name)
        expect(user_data[:attributes][:user_name]).to be_an(String)

        expect(user_data[:attributes]).to have_key(:email)
        expect(user_data[:attributes][:email]).to be_an(String)

        expect(user_data[:attributes]).to have_key(:street_address)
        expect(user_data[:attributes][:street_address]).to be_an(String)

        expect(user_data[:attributes]).to have_key(:city)
        expect(user_data[:attributes][:city]).to be_an(String)

        expect(user_data[:attributes]).to have_key(:state)
        expect(user_data[:attributes][:state]).to be_an(String)

        expect(user_data[:attributes]).to have_key(:zipcode)
        expect(user_data[:attributes][:zipcode]).to be_an(String)

        expect(user_data[:attributes]).to have_key(:activity_preferences)
        expect(user_data[:attributes][:activity_preferences]).to be_an(String)

        expect(user_data[:attributes]).to have_key(:latitude)
        expect(user_data[:attributes][:latitude]).to be_an(Float)

        expect(user_data[:attributes]).to have_key(:longitude)
        expect(user_data[:attributes][:longitude]).to be_an(Float)
      end
    end
  end
end
