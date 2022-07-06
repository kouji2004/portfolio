class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

      has_many :comments, dependent: :destroy
         # いいね機能
              has_many :favorites, dependent: :destroy
            # 投稿いいね一覧
                    has_many :favorite_posts, through: :favorites, source: :post

                    has_one :profile

                   # ボッチ演算子 &.
                    def profile_image
                      if profile&.image&.attached?
                       profile.image
                      else
                       'sample-author1.jpg'
                      end
                    end

                      # プロフィールの準備,論理演算　プロフィールがあればprofile更新 build_profile新規作成
                         def profile_prepare
                           profile || build_profile
                         end

                        def get_image
                          unless image.attached?
                            file_path = Rails.root.join('app/assets/images/no_image.jpg')
                            image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
                          end
                          image
                        end

                                    # ゲストログイン機能
                                            def self.guest
                                              find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
                                                user.password = SecureRandom.urlsafe_base64
                                                user.name = "guestuser"
                                              end
                                            end



                                                      # 検索方法分岐
                                                        def self.looks(search, word)
                                                          if search == "perfect_match"
                                                            @user = User.where("name LIKE?", "#{word}")
                                                          elsif search == "forward_match"
                                                            @user = User.where("name LIKE?","#{word}%")
                                                          elsif search == "backward_match"
                                                            @user = User.where("name LIKE?","%#{word}")
                                                          elsif search == "partial_match"
                                                            @user = User.where("name LIKE?","%#{word}%")
                                                          else
                                                            @user = User.all
                                                          end
                                                        end

end
