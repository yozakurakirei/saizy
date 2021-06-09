class Saizy < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many_attached :images
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  enum status: { draft: 0, published: 1, deleted: 2 } # 追加
  enum area: {
    default:0,hokkaido:1,aomori:2,iwate:3,miyagi:4,akita:5,yamagata:6,fukusima:7,
    ibaragi:8,tochigi:9,gunma:10,saitama:11,chiba:12,tokyo:13,kanagawa:14,
    niigata:15,toyama:16,ishikawa:17,fukui:18,yamanasi:19,nagano:20,
    gifu:21,sizuoka:22,aichi:23,mie:24,
    siga:25,kyoto:26,oosaka:27,hyogo:28,nara:29,wakayama:30,
    tottori:31,simane:32,okayama:33,hirosima:34,yamaguchi:35,
    tokushima:36,kagawa:37,ehime:38,kouchi:39,
    fukuoka:40,saga:41,nagasaki:42,kumamoto:43,ooita:44,miyazaki:45,kagosima:46, 
    okinawa:47
  }
  
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
