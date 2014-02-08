class Lodge < ActiveRecord::Base

  has_many :memberships, :dependent => :destroy
  has_many :members, through: :memberships, source: :user

  validates_presence_of :name, :sub_domain
  validates_format_of     :sub_domain, with: /\A[\w\-\_\.]+\Z/, if: "sub_domain.present?"
  validates_exclusion_of  :sub_domain, in: %w(support blog www billing help api m mobile biz),
                          message: "The sub_domain <strong>{{value}}</strong> is not available.",
                          if: "sub_domain.present?"
  validates_uniqueness_of :sub_domain, if: "sub_domain.present?"

end
