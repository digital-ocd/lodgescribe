require 'spec_helper'

describe Admin do

  it { should respond_to(:email) }
  it { should respond_to(:first_name) }
  it { should respond_to(:full_name) }
  it { should respond_to(:last_name) }

  describe "full_name" do
    it "return a concatinated first and last name" do
      admin = build_stubbed(:admin)
      admin.full_name.should == "#{admin.first_name} #{admin.last_name}"
    end
  end

  describe "Validations" do
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
  end

end

