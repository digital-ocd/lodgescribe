class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships, :dependent => :destroy
  has_many :lodges, through: :memberships

  validates_presence_of :first_name, :last_name, :username
  validates_format_of     :username, with: /\A[\w\-\_\.]+\Z/, if: "username.present?"
  validates_exclusion_of  :username, in: %w(support blog www billing help api m mobile biz),
                          message: "The username <strong>{{value}}</strong> is not available.",
                          if: "username.present?"
  validates_uniqueness_of :username, if: "username.present?"

  def full_name
    "#{first_name} #{last_name}"
  end

end
