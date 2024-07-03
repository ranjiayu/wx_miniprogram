# frozen_string_literal: true

module WxMiniprogram
  module OpenApi
    def clear_quota!
      post("cgi-bin/clear_quota",
            body: {:appid => @appid},
            query: {:access_token => @access_token}, need_access_token: true
      )
    end

    def get_api_quota
      post("cgi-bin/openapi/quota/get",
            query: {:access_token => @access_token}, need_access_token: true)
    end

    def get_rid_info(rid)
      post("cgi-bin/openapi/rid/get",
            body: {:rid => rid},
            query: {:access_token => @access_token}, need_access_token: true)
    end

    def clear_quota_by_app_secret(appid, appsecret)
      post("cgi-bin/clear_quota/v2",
            body: {:appid => appid, :appsecret => appsecret})
    end
  end
end
