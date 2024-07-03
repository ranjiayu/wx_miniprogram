# frozen_string_literal: true

module WxMiniprogram
  module Util
    def hmac_sha256(key, data)
      OpenSSL::HMAC.hexdigest("SHA256", key, data)
    end
  end
end
