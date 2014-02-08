require 'spec_helper'

describe "Authentication" do
  context "Lodge Member" do
    include_context 'lodge_with_member'

    it "authenticates the member" do
      visit new_user_session_path
      fill_in 'Email', with: member.email
      fill_in 'Password', with: valid_user[:password]
      click_on 'submit_user_signin'
      expect(current_url).to eq(user_root_url)
    end

    it "signs the member out" do
      visit new_user_session_path
      fill_in 'Email', with: member.email
      fill_in 'Password', with: valid_user[:password]
      click_on 'submit_user_signin'
      expect(page).to have_content "#{member.full_name}"
      click_on "#{member.full_name}"
      click_on "Sign Out"
      expect(current_url).to eq(new_user_session_url)
    end
  end

end