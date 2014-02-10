require 'spec_helper'

describe Lodge do

  it { should respond_to(:name) }
  it { should respond_to(:sub_domain) }

  describe "Validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:sub_domain)}

    context "sub_domain" do
      it { should validate_uniqueness_of(:sub_domain)}

      it "should allow valid formats" do
        %w(foo.bar foo_bar foo-bar 007foo foo007 FooBar 109).each do |valid_sub_domain|
          lodge_with_valid_sub_domain = build(:lodge, :sub_domain => valid_sub_domain)
          lodge_with_valid_sub_domain.should be_valid
          lodge_with_valid_sub_domain.errors[:sub_domain].should == []
        end
      end

      it "should not allow invalid formats" do
        %w(foo@bar foo!bar foo#bar).each do |bad_sub_domain|
          lodge_with_bad_sub_domain = build(:lodge, :sub_domain => bad_sub_domain)
          lodge_with_bad_sub_domain.should_not be_valid
          lodge_with_bad_sub_domain.errors[:sub_domain].should_not be_nil
        end
      end

      it "should exclude reserved names" do
        %w(support blog www billing help api m mobile biz).each do |reserved_sub_domain|
          lodge_with_reserved_sub_domain = build(:lodge, :sub_domain => reserved_sub_domain)
          lodge_with_reserved_sub_domain.should_not be_valid
          lodge_with_reserved_sub_domain.errors[:sub_domain].should_not be_nil
        end
      end
    end

  end
end
