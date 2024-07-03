# frozen_string_literal: true

module WxMiniprogram
  module Login
    def code2session!(js_code)
      get("sns/jscode2session", query: {
        :appid        => @appid,
        :secret       => @secret,
        :js_code      => js_code,
        :grant_type   => "authorization_code",
      })
    end

    def check_session_key!(openid, session_key)
      get("wxa/checksession", query: {
        :access_token => @access_token,
        :openid       => openid,
        :signature    => hmac_sha256(session_key, ""),
        :sigmethod    => "hmac_sha256"
      })
    end

    def reset_user_session_key!(openid, session_key)
      get("wxa/resetusersessionkey", query: {
        :access_token => @access_token
      }, body: {
        :openid => openid,
        :signature    => hmac_sha256(session_key, ""),
        :sigmethod    => "hmac_sha256"
      })
    end

  end
end
