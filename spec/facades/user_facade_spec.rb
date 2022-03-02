require 'rails_helper'

RSpec.describe UserFacade do
  context 'class methods' do
    context '::login_user' do
      it 'returns user data' do
        VCR.use_cassette('login-user') do
          params[:user_name] = "Bob_Barker"
          params[:password] = "123FakeStreet"
          user_data = {user: params[:user_name], password: params[:password]}
          user = UserFacade.login_user(user_data)

          expect(user).to be_a(Hash)
          expect(user).to have_key(:data)
          expect(user[:data]).to have_key(:id)
          expect(user[:data][:id]).to be_a(Integer)
        end
      end
    end

    context '::oauth_find' do
      context 'user is registered' do
        it 'returns user data' do
          VCR.use_cassette('oauth-user-happy-path') do
            auto_hash = {'info' => {'email' => "beardbikesandbeers@gmail.com"} }
            user_data = {email: auth_hash['info']['email']}
            user = UserFacade.oauth_find(user_data)

            expect(user).to be_a(Hash)
            expect(user).to have_key(:data)
            expect(user[:data]).to have_key(:id)
            expect(user[:data][:id]).to be_a(Integer)
          end
        end
      end

      context 'user is unregistered' do
        it 'returns partial data' do
          VCR.use_cassette('oauth-user-sortta-happy') do
            auto_hash = {'info' => {'email' => "beardbikesandbeers@gmail.com"} }
            user_data = {email: auth_hash['info']['email']}
            user = UserFacade.oauth_find(user_data)

            expect(user).to be_a(Hash)
            expect(user).to have_key(:data)
            expect(user[:data]).to have_key(:id)
            expect(user[:data][:id]).to be(nil)
          end
        end
      end
    end
  end
end
