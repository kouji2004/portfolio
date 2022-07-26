class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

# バリデーション機能
  validates :title,length: { maximum: 7 }
  validates :body,length: { maximum: 150 }
  validates :prevention,length: { maximum: 150 }
  validates :images, presence: true



    has_many :comments, dependent: :destroy
      # いいね機能
          has_many :favorites, dependent: :destroy

              # 投稿いいね一覧
                  has_many :favorite_users, through: :favorites, source: :user

                    # 複数の写真で使う
                       has_many_attached :images

                      # 検索タグ
                           scope :on_category, ->(category){where(category_id: category)}
                          def get_image
                            unless image.attached?
                              file_path = Rails.root.join('app/assets/images/no_image.jpg')
                              image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
                            end
                            image
                          end

                          #ユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる
                          def favorited_by?(user)
                            favorites.exists?(user_id: user.id)
                          end

                              # 検索方法分岐 検索タグ　時に使用
                                def self.looks(search, word)
                                  # if search == "perfect_match"
                                  #   @post = Post.where("title LIKE?","#{word}")
                                  # elsif search == "forward_match"
                                  #   @post = Post.where("title LIKE?","#{word}%")
                                  # elsif search == "backward_match"
                                  #   @post = Post.where("title LIKE?","%#{word}")
                                  # elsif search == "partial_match"
                                    @post = Post.where("title LIKE?","%#{word}%")
                                  # else
                                  #   @post = Post.all
                                  # end
                                end


                        def get_image
                          unless images.attached?
                            file_path = Rails.root.join('app/assets/images/no_image.jpg')
                            image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
                          end
                          images
                        end

end
