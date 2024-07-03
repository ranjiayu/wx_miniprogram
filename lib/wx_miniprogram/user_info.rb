# frozen_string_literal: true

module WxMiniprogram
  module UserInfo

    def get_plugin_open_pid!(code)
      post("wxa/getpluginopenpid", query: {
        :access_token => @access_token
      }, body: {
        :code => code
      })
    end

    def check_encrypted_data!(str)
      post("wxa/business/checkencryptedmsg", query: {
        :access_token => @access_token
      }, body: {
        :encrypted_msg_hash => str
      })
    end

    def get_paid_unionid!(options)
      get("wxa/getpaidunionid", query: {
        :access_token => @access_token
      }, body: options)
    end

    def get_user_encryptKey!(openid, session_key)
      get("wxa/business", query: {
        :access_token => @access_token,
        :openid       => openid,
        :signature    => hmac_sha256(session_key, ""),
        :sig_method   => "hmac_sha256"
      })
    end

    def get_phone_number!(code, openid)
      post("wxa/business/getuserphonenumber", query: {
        :access_token => @access_token
      }, body: {
        :code   => code,
        :openid => openid
      })
    end

  end
end
