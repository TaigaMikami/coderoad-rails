module OAuthService
  class GetOAuthUser

    def self.call(auth)

      profile = SocialProfile.find_for_oauth(auth)

      user = current_or_profile_user(profile)

      unless user
        # 第３候補：認証データにemailが含まれていればそれを元にユーザーを探す。
        user = User.where(email: email).first if verified_email_from_oauth(auth)
        # 見つからなければ、ユーザーを新規作成。
        user ||= find_or_create_new_user(auth)
      end
      associate_user_with_profile!(user, profile)
      user
    end

    private

      class << self

        def current_or_profile_user(profile)
          user = profile.user
        end

        def find_or_create_new_user(auth)
          email = verified_email_from_oauth(auth)
          user = User.where(email: email).first if email
          if user.nil?
            user = User.new(
              name: auth.info.nickname,
              email: auth.info.email,
              password: Devise.friendly_token[0,20]
            )
            # email確認メール送信を延期するために一時的にemail確認済みの状態にする。
            user.skip_confirmation!
            binding.pry
            # email仮をデータベースに保存するため、validationを一時的に無効化。
            user.save(validate: false)
            user
          end
        end

        def verified_email_from_oauth(auth)
          auth.info.email if auth.info.email && (auth.info.verified || auth.info.verified_email)
        end

        # ユーザーとSocialProfileオブジェクトを関連づける。
        def associate_user_with_profile!(user, profile)
          profile.update!(user_id: user.id) if profile.user != user
        end
      end
  end
end