shared_context 'lodge_with_member' do
  let(:valid_user) { attributes_for(:user) }
  let(:valid_profile) { attributes_for(:profile) }
  let(:lodge) { create(:lodge) }
  let(:member) { lodge.members.create(valid_user.merge({profile_attributes: valid_profile}) ) }
end

