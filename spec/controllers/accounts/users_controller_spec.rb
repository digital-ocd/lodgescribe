require 'spec_helper'

describe Accounts::UsersController do
  include_context 'lodge_with_member'

  def valid_attributes
    { first_name: "Hiram", current_password: valid_user[:password] }
  end

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in member
  end

  describe "GET show" do
    it "assigns the current_user as @user" do
      get :show
      expect(assigns(:user)).to eq(member)
    end
  end

  describe "GET edit" do
    it "assigns a new user as @user" do
      get :edit, { }
      expect(assigns(:user)).to eq(member)
    end
  end

  describe "PUT update" do
    describe "with valid params" do

      it "updates the requested user" do
        put :update, { user: valid_attributes }
      end

      it "assigns the requested user as @user" do
        put :update, { user: valid_attributes }
        expect(assigns(:user)).to eq(member)
      end

      it "redirects to the lodge's member index" do
        put :update, { user: valid_attributes }
        expect(response).to redirect_to(user_account_path)
      end

    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        put :update, { user: {  email: '' } }
        expect(assigns(:user)).to eq(member)
      end

      it "re-renders the 'edit' template" do
        put :update, { user: {  email: '' } }
        expect(response).to render_template("edit")
      end
    end
  end

end
