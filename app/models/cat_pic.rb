# == Schema Information
#
# Table name: cat_pics
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CatPic < ApplicationRecord
  has_one_attached :image

  validates :image, attached: true, content_type: ["image/jpeg", "image/png"]
end
