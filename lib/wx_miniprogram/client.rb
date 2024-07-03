# frozen_string_literal: true

module WxMiniprogram
  class Client
    attr_accessor :debug
    include Util
    include Token
    include OpenApi
    include Login
    include UserInfo


    def initialize(appid, secret)
      @url = "https://api.weixin.qq.com/"
      @appid = appid
      @secret = secret
      @access_token = ""
      @expire = nil
      @debug = false
    end

    def refresh_token!
      get_access_token!
    end

    def method_missing(method, *args)
      method_str = method.to_s
      unless method_str.end_with? "!"
        origin_method = (method_str + "!").to_sym
        if self.respond_to? origin_method
          begin
            send(origin_method, args)
          rescue ApiError => e
            $stderr.puts "[debug]: #{e}" if @debug
            false
          end
        else
          raise Error, "undefined method #{method.to_s}"
        end
      else
        unless self.respond_to? method
          raise Error, "undefined method #{method.to_s}"
        end
      end
    end

    private
    def get(path, body: nil, query: nil, need_access_token: true)
      need_access_token && valid
      resp = request(path, body: body, query: query, method: "get")
      if !resp["errcode"].nil? && resp["errcode"] != 0
        raise ApiError, resp.to_s
      end
      resp
    end

    def post(path, body: nil, query: nil, need_access_token: true)
      need_access_token && valid
      resp = request(path, body: body, query: query, method: "post")
      if !resp["errcode"].nil? && resp["errcode"] != 0
        raise ApiError, resp.to_s
      end
      resp
    end

    # This method is from [gist-api-ruby](https://github.com/gistplatform/gist-api-ruby)
    def request(path, body: nil, query: nil, method: "get")
      unless query.nil?
        path += "?#{URI::encode_www_form(query)}"
      end
      @uri = URI(@url + path)
      request = send("http_#{method}").new(@uri.request_uri, {
        "Content-Type" => "application/json"
      })
      request.body = body.to_json unless body.nil?
      http = Net::HTTP.new(@uri.host, @uri.port)
      http.use_ssl = true
      http.read_timeout = 5
      response = http.request(request)
      raise ApiError, response.body unless response.is_a?(Net::HTTPSuccess)
      json_response = JSON.parse(response.body)
      return json_response
    end

    def http_get
      Net::HTTP::Get
    end

    def http_post
      Net::HTTP::Post
    end

    def http_patch
      Net::HTTP::Patch
    end

    def http_delete
      Net::HTTP::Delete
    end

    def valid
      if @access_token.empty?
        raise ApiError, "You must invoke 'get_access_token' method at first"
      end
    end

  end
end
