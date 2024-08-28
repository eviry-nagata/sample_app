class User < ApplicationRecord
    # 保存する前にemailを小文字に変換する
    before_save { email.downcase! }
    # lengthは文字数制限を指定するメソッド　prsenceは空白を許さないメソッド
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
  end
  