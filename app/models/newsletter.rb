# == Schema Information
#
# Table name: newsletters
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Newsletter < ApplicationRecord
  has_many :newsletter_sections, dependent: :destroy
  accepts_nested_attributes_for :newsletter_sections, allow_destroy: true
end
