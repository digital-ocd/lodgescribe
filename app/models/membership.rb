class Membership < ActiveRecord::Base
  belongs_to :lodge
  belongs_to :user


end
