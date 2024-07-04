# frozen_string_literal: true

module WxMiniprogram
  module QRCode

    # 必填 path: 扫码进入的小程序页面路径
    # 非必填 {width: number, auto_color: boolean, line_color: {r: "", g: "", b: ""}}
    def get_qrcode!(path, width=nil, auto_color=false, line_color=nil)
      body = {}
      body[:width] = width unless width.nil?
      body[:auto_color] = auto_color if auto_color
      body[:line_color] = line_color unless line_color.nil?
      post("wxa/getwxacode",
        query: {:access_token => @access_token},
        body: body
      )
    end

    # 必填 scene
    # 非必填 {page: string, check_path: boolean, env_version: string, width: number,
    # auto_color: boolean, line_color: {r: string, g: string, b: string}, is_hyaline: boolean}
    def get_unlimited_qrcode!(scene, path=nil, check_path=nil, env_version=nil, width=nil, auto_color=nil, line_color=nil, is_hyaline=nil)
      body = {}
      body[:path] = path unless path.nil?
      body[:check_path] = check_path unless check_path.nil?
      body[:env_version] = env_version unless env_version.nil?
      body[:width] = width unless width.nil?
      body[:auto_color] = auto_color unless auto_color.nil?
      body[:line_color] = line_color unless line_color.nil?
      body[:is_hyaline] = is_hyaline unless is_hyaline.nil?
      post("wxa/getwxacodeunlimit",
        query: {:access_token => @access_token},
        body: body
      )
    end

    def create_qrcode!(path, width=430)
      post("cgi-bin/wxaapp/createwxaqrcode",
        query: {:access_token => @access_token, :path => path},
        body: {:width => width}
      )
    end

  end
end
