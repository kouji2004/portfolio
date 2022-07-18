class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, presence: true
  # 検索タグ機能
  scope :request_category, ->(category){find(category.to_i)}
end
