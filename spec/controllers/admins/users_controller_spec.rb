require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe Admins::UsersController do
  let(:valid_attributes) { attributes_for(:admin) }
  let(:admin) { create(:admin) }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in admin
  end

  describe "GET index" do
    it "assigns all admins_users as @saas_admins" do
      get :index, {}
      expect(assigns(:saas_admins)).to eq([admin])
    end
  end

  describe "GET show" do
    it "assigns the requested admins_user as @saas_admin" do
      get :show, {id: admin.id}
      expect(assigns(:saas_admin)).to eq(admin)
    end
  end

  describe "GET new" do
    it "assigns a new admins_user as @saas_admin" do
      get :new, {}
      expect(assigns(:saas_admin)).to be_a_new(Admin)
    end
  end

  describe "GET edit" do
    it "assigns the requested admins_user as @saas_admin" do
      get :edit, {id: admin.id}
      expect(assigns(:saas_admin)).to eq(admin)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Admin" do
        expect {
          post :create, {admin: valid_attributes}
        }.to change(Admin, :count).by(1)
      end

      it "assigns a newly created admins_user as @saas_admin" do
        post :create, {admin: valid_attributes}
        expect(assigns(:saas_admin)).to be_a(Admin)
        expect(assigns(:saas_admin)).to be_persisted
      end

      it "redirects to the created admins_user" do
        post :create, {admin: valid_attributes}
        expect(response).to redirect_to(admin_users_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved admins_user as @saas_admin" do
        post :create, { admin: { email: "" } }
        expect(assigns(:saas_admin)).to be_a_new(Admin)
      end

      it "re-renders the 'new' template" do
        post :create, { admin: { email: "" } }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    let(:user) { create(:admin) }
    describe "with valid params" do
      it "updates the requested admins_user" do
        expect_any_instance_of(Admin).to receive(:update).with({ "email" => "spider-man@avengers.com" })
        put :update, {id: user.id, admin: { "email" => "spider-man@avengers.com" }}
      end

      it "assigns the requested admins_user as @saas_admin" do
        put :update, {id: user.id, admin: valid_attributes}
        expect(assigns(:saas_admin)).to eq(user)
      end

      it "redirects to the admins_user" do
        put :update, {id: user.id, admin: valid_attributes}
        expect(response).to redirect_to(admin_users_path)
      end
    end

    describe "with invalid params" do
      it "assigns the admins_user as @saas_admin" do
        put :update, {id: user.id,  admin: { email: "" } }
        expect(assigns(:saas_admin)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        put :update, {id: user.id,  admin: { email: "" } }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested admins_user" do
      new_admin = Admin.create! valid_attributes
      expect {
        delete :destroy, {id: new_admin.id}
      }.to change(Admin, :count).by(-1)
    end

    it "redirects to the admins_users list" do
      new_admin = Admin.create! valid_attributes
      delete :destroy, {id: new_admin.id}
      expect(response).to redirect_to(admin_users_path)
    end
  end

end
