require 'spec_helper'

describe Admin do

  it { should respond_to(:email) }
  it { should respond_to(:first_name) }
  it { should respond_to(:full_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:saas_admin?) }

  describe "full_name" do
    it "return a concatinated first and last name" do
      admin = build_stubbed(:admin)
      expect(admin.full_name).to eq("#{admin.first_name} #{admin.last_name}")
    end
  end

  describe "saas_admin?" do
    it "returns true" do
      admin = build_stubbed(:admin)
      expect(admin.saas_admin?).to be true
    end
  end

  describe "Validations" do
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
  end

end

