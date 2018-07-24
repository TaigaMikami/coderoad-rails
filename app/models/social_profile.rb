class SocialProfile < ApplicationRecord
  belongs_to :user

  def self.find_for_oauth(auth)
    profile = find_or_create_by(
                                  uid: auth.uid,
                                  provider: auth.provider,
                                  nickname: auth.info.nickname,
                                  image_url: auth.info.image,
                                )
    # profile.save_oauth_data!(auth)
    profile
  end
end
