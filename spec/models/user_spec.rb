require 'spec_helper'

describe User do

  it { should respond_to(:email) }
  it { should respond_to(:first_name) }
  it { should respond_to(:full_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:username) }

  describe "full_name" do
    it "return a concatinated first and last name" do
      u = build_stubbed(:user)
      expect(u.full_name).to eq("#{u.first_name} #{u.last_name}")
    end
  end

  describe "Validations" do

    [:first_name, :last_name, :username, :email].each do |attr|
      it "must have a #{attr}" do
        u = build(:user, attr => nil)
        u.should_not be_valid
        u.errors[attr].should_not be_nil
      end
    end

    context "username" do
      it { should validate_uniqueness_of(:username)}

      it "should allow valid formats" do
        %w(foo.bar foo_bar foo-bar 007foo foo007 FooBar).each do |valid_username|
          user_with_valid_username = build(:user, :username => valid_username)
          user_with_valid_username.should be_valid
          user_with_valid_username.errors[:username].should == []
        end
      end

      it "should not allow invalid formats" do
        %w(foo@bar foo!bar foo#bar).each do |bad_username|
          user_with_bad_username = build(:user, :username => bad_username)
          user_with_bad_username.should_not be_valid
          user_with_bad_username.errors[:username].should_not be_nil
        end
      end

      it "should exclude reserved names" do
        %w(support blog www billing help api m mobile biz).each do |reserved_username|
          user_with_reserved_username = build(:user, :username => reserved_username)
          user_with_reserved_username.should_not be_valid
          user_with_reserved_username.errors[:username].should_not be_nil
        end
      end
    end

  end

end
