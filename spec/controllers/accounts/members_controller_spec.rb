require 'spec_helper'

describe Accounts::MembersController do
  let(:valid_attributes) { attributes_for(:user) }
  include_context 'lodge_with_member'

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in member
  end

  describe "GET index" do
    it "assigns all users as @users" do
      get :index, { sub_domain: lodge.sub_domain }
      expect(assigns(:users)).to eq([member])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :show, { sub_domain: lodge.sub_domain, id: user.id}
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET new" do
    context "as a Lodge Member" do
      it "raises a 401 exception" do
        expect {
          get :new, { sub_domain: lodge.sub_domain }
        }.to raise_error ApplicationController::Unauthorized
      end
    end

    context "as a Lodge Officer" do
      it "assigns a new user as @user" do
        allow(controller.current_user).to receive(:can_admin?).and_return(true)
        get :new, { sub_domain: lodge.sub_domain }
        expect(assigns(:user)).to be_a_new(User)
      end
    end
  end

  describe "GET edit" do
    context "as a general Lodge Member" do
      it "raises a 401 exception" do
        expect {
          get :edit, { sub_domain: lodge.sub_domain, id: 24 }
        }.to raise_error ApplicationController::Unauthorized
      end
    end

    context "as a Lodge Officer" do
      it "assigns a new user as @user" do
        allow(controller.current_user).to receive(:can_admin?).and_return(true)
        user = lodge.members.create! valid_attributes
        get :edit, { sub_domain: lodge.sub_domain, id: user.id }
        expect(assigns(:user)).to eq(user)
      end
    end

    context "as the user" do
      it "assigns a new user as @user" do
        get :edit, { sub_domain: lodge.sub_domain, id: member.id }
        expect(assigns(:user)).to eq(member)
      end
    end
  end

  describe "POST create" do
    describe "with valid params" do
      context "as a general Lodge Member" do
        it "raises a 401 exception" do
          expect {
            get :create, { sub_domain: lodge.sub_domain, user: valid_attributes }
          }.to raise_error ApplicationController::Unauthorized
        end
      end

      context "as a Lodge Officer" do
        before(:each) do
          allow(controller.current_user).to receive(:can_admin?).and_return(true)
        end

        it "creates a new User" do
          expect {
            post :create, { sub_domain: lodge.sub_domain, user: valid_attributes }
          }.to change(User, :count).by(1)
        end

        it "assigns a newly created user as @user" do
          post :create, { sub_domain: lodge.sub_domain, user: valid_attributes }
          expect(assigns(:user)).to be_a(User)
          expect(assigns(:user)).to be_persisted
        end

        it "redirects to the lodge member index" do
          post :create, { sub_domain: lodge.sub_domain, user: valid_attributes }
          expect(response).to redirect_to(lodge_members_path(lodge.sub_domain))
        end
      end

    end

    describe "with invalid params" do
      before(:each) do
        allow(controller.current_user).to receive(:can_admin?).and_return(true)
      end

      it "assigns a newly created but unsaved user as @user" do
        post :create, { sub_domain: lodge.sub_domain, user: { email: '' } }
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, { sub_domain: lodge.sub_domain, user: { email: '' } }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      context "as a general Lodge Member" do
        it "raises a 401 exception" do
          expect {
            get :update, { sub_domain: lodge.sub_domain, id: 2, user: { "first_name" => "Hiram" } }
          }.to raise_error ApplicationController::Unauthorized
        end
      end

      context "as a Lodge Officer" do
        before(:each) do
          allow(controller.current_user).to receive(:can_admin?).and_return(true)
        end

        it "updates the requested user" do
          user = User.create! valid_attributes
          expect_any_instance_of(User).to receive(:update).with({ "first_name" => "Hiram" })
          put :update, { sub_domain: lodge.sub_domain, id: user.id, user: { "first_name" => "Hiram" }}
        end

        it "assigns the requested user as @user" do
          put :update, { sub_domain: lodge.sub_domain, id: member.id, user: valid_attributes }
          expect(assigns(:user)).to eq(member)
        end

        it "redirects to the lodge's member index" do
          put :update, { sub_domain: lodge.sub_domain, id: member.id, user: valid_attributes }
          expect(response).to redirect_to(lodge_members_path(lodge.sub_domain))
        end
      end

      context "as the user" do
        it "updates the requested user" do
          expect_any_instance_of(User).to receive(:update).with({ "first_name" => "Hiram" })
          put :update, { sub_domain: lodge.sub_domain, id: member.id, user: { "first_name" => "Hiram" }}
        end
      end

    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        put :update, { sub_domain: lodge.sub_domain, id: member.id, user: {  email: '' } }
        expect(assigns(:user)).to eq(member)
      end

      it "re-renders the 'edit' template" do
        put :update, { sub_domain: lodge.sub_domain, id: member.id, user: {  email: '' } }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    context "as a general Lodge Member" do
      it "raises a 401 exception" do
        user = lodge.members.create! valid_attributes
        expect {
          get :destroy, { sub_domain: lodge.sub_domain, id: user.id }
        }.to raise_error ApplicationController::Unauthorized
      end
    end

    context "as a Lodge Officer" do
      before(:each) do
        allow(controller.current_user).to receive(:can_admin?).and_return(true)
      end

      context "member with no other affiliations" do
        it "destroys the requested user" do
          user              = lodge.members.create! valid_attributes
          user_count        = User.count
          membership_count  = Membership.count

          delete :destroy, { sub_domain: lodge.sub_domain, id: user.id}
          expect(User.count).to eq(user_count - 1)
          expect(Membership.count).to eq(membership_count - 1)
        end

        it "redirects to the users list" do
          user = lodge.members.create! valid_attributes
          delete :destroy, { sub_domain: lodge.sub_domain, id: user.id}
          expect(response).to redirect_to(lodge_members_path(lodge.sub_domain))
        end
      end

      context "member with other affiliations" do
        it "destroys the membership affiliation" do
          lodge_2           = create(:lodge)
          user              = lodge.members.create! valid_attributes
          lodge_2.memberships.create({user_id: user.id})
          user_count        = User.count
          membership_count  = Membership.count

          delete :destroy, { sub_domain: lodge.sub_domain, id: user.id}
          expect(User.count).to eq(user_count)
          expect(Membership.count).to eq(membership_count - 1)
        end
      end

    end

    context "as the user" do
      it "redirects to the lodge's member index" do
        delete :destroy, { sub_domain: lodge.sub_domain, id: member.id}
        expect(response).to redirect_to(lodge_members_path(lodge.sub_domain))
      end
    end

  end
end
