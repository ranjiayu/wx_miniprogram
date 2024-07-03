# frozen_string_literal: true

module WxMiniprogram
  module Token
    def get_access_token!
      resp = get("cgi-bin/token", query: {
        :grant_type => "client_credential",
        :appid      => @appid,
        :secret     => @secret
      })
      unless resp["access_token"].nil?
        @access_token = resp["access_token"]
        @expire = resp["expires_in"] + Time.now.to_i
      end
      resp
    end

    def get_stable_access_token!(force_refresh=false)
      resp = post("cgi-bin/stable_token", body: {
        :grant_type     => "client_credential",
        :appid          => @appid,
        :secret         => @secret,
        :force_refresh  => force_refresh
      })
      unless resp["access_token"].nil?
        @access_token = resp["access_token"]
        @expire = resp["expires_in"] + Time.now.to_i
      end
      resp
    end

    def expire
      @expire
    end

    def expired?
      Time.now.to_i >= @expire
    end

  end
end
