class Profile < ApplicationRecord

belongs_to :user

validates :mainbody,length: { maximum: 30 }
validates :subbody,length: { maximum: 10 }

  has_one_attached :image

  enum gender: { male: 0, female: 1, other: 2 }

end
