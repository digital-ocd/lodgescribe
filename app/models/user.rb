class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships, :dependent => :destroy
  has_many :lodges, through: :memberships

  has_one :profile
  delegate :birth_city, :birth_country, :birth_date, :birth_state, :initiated_at, :passed_at, :raised_at, to: :profile, allow_nil: true

  validates_presence_of :email, :first_name, :last_name, :username
  validates_format_of     :username, with: /\A[\w\-\_\.]+\Z/, if: "username.present?"
  validates_exclusion_of  :username, in: %w(support blog www billing help api m mobile biz),
                          message: "The username <strong>{{value}}</strong> is not available.",
                          if: "username.present?"
  validates_uniqueness_of :username, if: "username.present?"

  def can_admin?(lodge)
    m = memberships.find_by_lodge_id(lodge.id)
    if m
      m.role == "officer" ? true : false
    else
      false
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def saas_admin?
    false
  end


end
