require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to render_template('new')
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to render_template('index')
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    context "With invalid params" do

      it "Validate Prensence of Username and Password" do
        post :create, params: { user: { username: 'jkl' } }
        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present
      end

    end

    context "With valid params" do

      it "returns http success" do
        post :create, params: { user: { username: 'jkl', password: 'password' } }
        expect(response).to redirect_to(user_url(User.last))
        expect(response).to have_http_status(:success)
      end

    end
  end

  describe "GET #edit" do
    it "returns http success" do

      get :edit, params: { id: 1 }
      expect(response).to render_template('edit')
      expect(response).to have_http_status(:success)
    end

    context "With valid params" do

    end

    context "Without valid params" do
      
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      delete :destroy
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to render_template('index')
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      patch :update
      expect(response).to have_http_status(:success)
    end
  end

end
