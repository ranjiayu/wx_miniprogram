# frozen_string_literal: true

module WxMiniprogram
  module OpenApi
    def clear_quota!
      post("cgi-bin/clear_quota",
            body: {:appid => @appid},
            query: {:access_token => @access_token})
    end

    def get_api_quota!(cgi_path)
      post("cgi-bin/openapi/quota/get",
            query: {:access_token => @access_token},
            body: {:cgi_path => cgi_path}
      )
    end

    def get_rid_info!(rid)
      post("cgi-bin/openapi/rid/get",
            body: {:rid => rid},
            query: {:access_token => @access_token})
    end

    def clear_quota_by_app_secret!(appid, appsecret)
      post("cgi-bin/clear_quota/v2",
            body: {:appid => appid, :appsecret => appsecret},
            need_access_token: false
      )
    end
  end
end
