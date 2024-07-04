# frozen_string_literal: true

module WxMiniprogram
  module UrlLink
    def generate_url_link!(path=nil, query=nil, expire_type=nil, expire_time=nil, expire_interval=nil, cloud_base=nil, env_version=nil)
      body = {}
      local_variables.each do |var_sym|
        v = binding.local_variable_get(var_sym)
        body[var_sym] = v if !v.nil? && var_sym != :body
      end
      post("wxa/generate_urllink",
        query: {:access_token => @access_token},
        body: body
      )
    end

    def query_url_link!(url_link=nil, query_type=nil)
      body = {}
      body[:url_link] = url_link unless url_link.nil?
      body[:query_type] = query_type unless query_type.nil?
      post("wxa/query_urllink",
        query: {:access_token => @access_token},
        body: body
      )
    end

    def generate_short_link!(page_url, page_title=nil, is_permanent=nil)
      body = {:page_url => page_url}
      body[:page_title] = page_title unless page_title.nil?
      body[:is_permanent] = is_permanent unless is_permanent.nil?
      post("wxa/genwxashortlink",
        query: {:access_token => @access_token},
        body: body
      )
    end
  end
end
