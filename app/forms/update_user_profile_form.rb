class UpdateUserProfileForm
  include ActiveModel::Model

  def persisted?
    false
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, "User")
  end

  delegate :birth_city, :birth_date, :birth_state, :birth_country, to: :profile
  delegate :email, :first_name, :last_name, to: :user

  validates_presence_of :email, :first_name, :last_name

  def initialize(user)
    @user    = user
    @profile = user.profile
  end

  def submit(params)
    user.attributes    = params.slice(:email, :first_name, :last_name)
    profile.attributes = params.slice(:birth_city, :birth_date, :birth_state, :birth_country)
    if valid?
      user.save!
      profile.save!
      true
    else
      false
    end
  end

  private

  attr_accessor :profile, :user

end
