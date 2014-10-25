class FacebookPolicy

  def initialize(auth)
    @auth = auth
  end

  def first_name
    @auth.info.first_name
  end

  def last_name
    @auth.info.last_name
  end

  def email
    @auth.info.last_name
  end

  def username
    @auth.info.nickname
  end

  def image_url
    "http://graph.facebook.com/#{auth.info.nickname}/picture?type=large"
  end

  def uid
    @auth.uid
  end

  def oauth_token
    @auth.credentials.token
  end

  def oauth_expires
    Time.at(@auth.credentials.expires_at)
  end

  def oauth_secret
    nil
  end

  def create_callback(account)
    # Place mmethods you want to trigger on Facebook Oauth creation here
  end

  def refresh_call(account)
    # Place any methods you want to trigger on subsequent Facebook OAuth logins here
  end

end
