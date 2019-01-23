class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :omniauthable

  enum gender: [:not_choose, :man, :woman]
  enum grade: [:default, :member, :admin]

  KOR_NAME = {default: "일반회원", member: "멤버", admin: "관리자"}


  mount_uploader :image, ImageUploader

  # sns로그인 (identity)
  has_one :identity

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil?
      auth_email = auth.info.email
      user = User.where(email: auth_email).first
      unless user.present?
        if auth.info.email.nil?
          if auth.provider == "kakao"
            user = User.new(
                email: "kakaoUser@#{auth.uid}.com",
                remote_image_url: auth.info.image,
                name: auth.info.name,
                password: Devise.friendly_token[0,20]
              )
          elsif auth.provider == "facebook"
            user = User.new(
                email: "facebookUser@#{auth.uid}.com",
                remote_image_url: auth.info.image,
                name: auth.info.name,
                password: Devise.friendly_token[0,20]
              )
          end
        else
          user = User.new(
              email: auth.info.email,
              remote_image_url: auth.info.image,
              name: auth.info.name,
              password: Devise.friendly_token[0,20]
          )
        end
        # user.skip_confirmation! # 이메일 인증이 있는 경우 인증을 자동 완료해줌
        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save
    end

    user #user 리턴
  end

end
