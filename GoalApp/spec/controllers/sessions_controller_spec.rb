require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    it "renders sign in page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it "signs in the user" do
        User.create(username: 'bob', password: '123456')
        post :create, user: {username: "bob", password: "123456"}
        expect(response).to redirect_to user_url(User.last)
      end
    end

    context 'with invalid params' do
      it "redirects to sign in page" do
        post :create, user: {username: 'not_bob'}
        expect(response).to redirect_to new_session_url
      end
    end
  end

  describe "DELETE #destroy" do
    it "should log out the user" do
      User.create(username: 'bob', password: '123456')
      post :create, user: {username: "bob", password: "123456"}
      old_token = User.last.session_token
      delete :destroy
      expect(User.last.session_token).not_to eq(old_token)
    end
  end
end
