# frozen_string_literal: true

module WxMiniprogram
  module Util
    def hmac_sha256(data, key)
      OpenSSL::HMAC.hexdigest("SHA256", key, data)
    end
  end
end
