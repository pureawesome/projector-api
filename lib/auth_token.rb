class AuthToken
  def self.encode(payload, ttl_in_minutes = 1440)
    payload[:exp] = ttl_in_minutes.minutes.from_now.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
    # TODO: Change the secrets base
  end

  def self.decode(token, leeway = nil)
    decoded = JWT.decode(token, Rails.application.secrets.secret_key_base, leeway: leeway)
    HashWithIndifferentAccess.new(decoded[0])
  end
end
