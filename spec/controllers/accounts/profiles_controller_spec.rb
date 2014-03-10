require 'spec_helper'

describe Accounts::ProfilesController do
  include_context 'lodge_with_member'

  let(:valid_attributes) { attributes_for(:profile).slice!(:initiated_at, :passed_at, :raised_at) }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in member
  end

  describe "GET show" do
    it "assigns the current_user profile as @profile" do
      get :show
      expect(assigns(:profile)).to eq(member.profile)
    end
  end

  describe "GET edit" do
    it "assigns the current_user profile as @profile" do
      get :edit, { }
      expect(assigns(:profile)).to eq(member.profile)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested profile" do
        put :update, { profile: valid_attributes }
      end

      it "assigns the requested profile as @profile" do
        put :update, { profile: valid_attributes }
        expect(assigns(:profile)).to eq(member.profile)
      end

      it "redirects to the profile" do
        put :update, { profile: valid_attributes }
        expect(response).to redirect_to(edit_user_profile_path)
      end
    end

    describe "with invalid params" do
      it "assigns the profile as @profile" do
        allow_any_instance_of(Profile).to receive(:update).and_return(false)
        put :update, { profile: { } }
        expect(assigns(:profile)).to eq(member.profile)
      end

      # it "re-renders the 'edit' template", :focus do
      #   allow_any_instance_of(Profile).to receive(:update).and_return(false)
      #   put :update, { profile: { } }
      #   expect(response).to render_template("edit")
      # end
    end
  end

end
