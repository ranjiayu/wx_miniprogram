# frozen_string_literal: true

module WxMiniprogram
  module UrlScheme
    def generate_nfc_scheme!(model_id, jump_wxa={}, sn=nil)
      body = {:jump_wxa => jump_wxa, :model_id => model_id}
      body[:sn] = sn unless sn.nil?
      post("wxa/generatenfcscheme",
        query: {:access_token => @access_token},
        body: body
      )
    end

    def generate_scheme!(jump_wxa={}, expire_time=nil, expire_type=nil, expire_interval=nil)
      body = {:jump_wxa => jump_wxa}
      body[:expire_time] = expire_time unless expire_time.nil?
      body[:expire_type] = expire_type unless expire_type.nil?
      body[:expire_interval] = expire_interval unless expire_interval.nil?
      post("wxa/generatescheme",
        query: {:access_token => @access_token},
        body: body
      )
    end

    def query_scheme!(scheme=nil, query_type=nil)
      body = {}
      body[:scheme] = scheme unless scheme.nil?
      body[:query_type] = query_type unless query_type.nil?
      post("wxa/queryscheme",
        query: {:access_token => @access_token},
        body: body
      )

    end

  end
end
