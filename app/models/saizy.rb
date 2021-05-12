class Saizy < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  enum status: { draft: 0, published: 1, deleted: 2 } # 追加
  validates :status, inclusion: { in: Saizy.statuses.keys }

  accepts_nested_attributes_for :tags, :reject_if => proc { |att| att[:name].blank?}
  before_save :find_or_create_tag

  # images
  validates :images,  content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "画像は.jpeg .gif .pngのみになります" },
                      size: { less_than: 5.megabytes,
                              message: "画像は5MB以下までです。" }

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
