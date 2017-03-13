module UserHelper
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:twitter] = fake_auth_hash
  end

  def fake_auth_hash
    {
      'provider' => 'twitter',
      'uid' => '123544',
      'info' => {
        'name' => 'mockuser',
        'image' => 'mock_user_thumbnail_url'
      },
      'credentials' => {
        'token' => 'mock_token',
        'secret' => 'mock_secret'
      },
    }
  end

  def login_as(user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(user)
  end
end
