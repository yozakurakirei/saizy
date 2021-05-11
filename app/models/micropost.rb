class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }

  # with_optionでまとめる
  with_options presence: true do
    validates :user_id, presence: true
    validates :content, presence: true
    validates :title, length: { maximum: 140 }
    validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                       message: "投稿できるのは .jpeg .gif .pngのみになります" },
                      size: { less_than: 5.megabytes,
                               message: "投稿できるのは5MBまでになります。"}
  end


  # リサイズ済画像
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
