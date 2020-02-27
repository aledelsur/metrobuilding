# == Schema Information
#
# Table name: images
#
#  id                    :bigint           not null, primary key
#  url                   :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  newsletter_section_id :integer
#

class Image < ApplicationRecord
  belongs_to :newsletter_section
end
