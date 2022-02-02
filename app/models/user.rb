class User < ApplicationRecord

  has_many :created_events, class_name: "Event", foreign_key: "owner_id"

  def self.find_or_create_from_auth_hash!(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    image_url = auth_hash[:info][:image]

    User.find_or_create_by!(provider: provider, uid: uid) do |user|
      user.name = nickname
      user.image_url = image_url
    end

    # find_or_create_byメソッドはActive Recordが用意しているメソッド。
    # 引数で渡したproviderとuidを持つレコードが存在していたら、そのオブジェクトを返すけど、
    # ないならprovider, uid, name, image_urlを設定してレコードを作成して、そのオブジェクトを返してねということ
  end
end
