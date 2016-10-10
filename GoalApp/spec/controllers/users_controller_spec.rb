require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "renders the new user page" do
    get :new
    expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    it "renders the show page" do
      User.create(username: 'bob', password: '123456')
      get :show, id: 1
      expect(response).to render_template('show')
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates the user and renders the show page" do
        post :create, user: {username: "user", password: "password"}
        expect(response).to redirect_to user_url(User.last)
      end
    end
    context "with invalid params" do
      it " does not create the user and renders the new page" do
        post :create, user: {username: "user"}
        expect(response).to redirect_to new_user_url
      end
    end
  end

  describe "GET #index" do
    it "renders the index page" do
      get :index
      expect(response).to render_template (:index)
    end
  end

end
