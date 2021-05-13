class Saizy < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many_attached :images
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  enum status: { draft: 0, published: 1, deleted: 2 } # 追加
  
  accepts_nested_attributes_for :tags, :reject_if => proc { |att| att[:name].blank?}
  before_save :find_or_create_tag
  
  validates :status, inclusion: { in: Saizy.statuses.keys }
  # images
  validates :images,  content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "画像は.jpeg .gif .pngのみになります" },
                      size: { less_than: 5.megabytes,
                              message: "画像は5MB以下までです。" }
  
  with_options presence: true do 
    validates :content, length: { maximum: 400 }
    validates :title, length: { maximum: 144 }
    validates :name, length: { maximum: 144 }
    validates :place, length: { maximum: 100 }
  end

  private 
    def find_or_create_tag
      tag_array = []
      self.tags.map { |tag| tag.name.strip.split(",").each do |name| tag_array << name
                      end }
      self.tags.destroy_all
      tag_array.each do |tag|
        self.tags << Tag.find_or_create_by(name: tag)
      end
    end
end
