class Photo < ApplicationRecord
  belongs_to :user
  has_many :upvotes, dependent: :destroy
  has_attached_file :image, default_url: "missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
