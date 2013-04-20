# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  iso_code   :string(255)
#

class Country < ActiveRecord::Base
  attr_accessible :iso_code, :name

  validates :name, presence: true
end
