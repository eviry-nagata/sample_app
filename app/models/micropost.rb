class Micropost < ApplicationRecord
  belongs_to :user
  # この行は、データベースからマイクロポストを取得するときに、created_at属性を使って並べ替えるように指示している
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  # ここで、content属性に対するバリデーションを追加している
  # validatesは、引数として属性名とバリデーションの種類を受け取る
  # presence: trueは、その属性が存在していることを確認するバリデーション
  # データベースに保存される前に、content属性が存在しているかどうかを確認する
  # user_idがnillの場合、バリデーションが失敗する
  validates :user_id, presence: true
  # content属性が存在していることと、長さが140文字以下であることを確認する
  validates :content, presence: true, length: { maximum: 140 }
  # 下記で定義したpicture_sizeメソッドを使って、アップロードされた画像のサイズを検証する
  validate  :picture_size

  private
  # アップロードされた画像のサイズをバリデーションする
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
