shared_context 'lodge_with_member' do
  let(:valid_user) { attributes_for(:user) }
  let(:valid_profile) { attributes_for(:profile) }
  let(:lodge) { create(:lodge) }
  let(:member) { lodge.members.create(valid_user) }

  before do
    member.create_profile(valid_profile)
  end
end
