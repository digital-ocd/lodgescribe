shared_context 'lodge_with_member' do
  let(:valid_user) { attributes_for(:user) }
  let(:lodge) { create(:lodge) }
  let(:member) { lodge.members.create(valid_user) }
end

