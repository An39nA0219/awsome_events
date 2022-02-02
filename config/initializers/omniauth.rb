Rails.application.config.middleware.use OmniAuth::Builder do
  # 開発環境・テスト環境の場合は平文のものを使い、本番環境ではクレデンシャルに保存したものを使わせる
  if Rails.env.development? || Rails.env.test?
    provider :github, "84efedf8c3c76b64417d", "c61b1ec39a53d63aa6fd2957dd0c95f77f34a2aa"
  else
    provider :github,
      Rails.application.credentials.github[:client_id],
      Rails.application.credentials.github[:client_secret]
  end
end