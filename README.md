# WxMiniprogram

Ruby微信小程序服务端API

DONE：接口调用凭据、openApi管理、小程序登陆、用户信息、小程序码与小程序链接

TODO: 小程序客服、消息相关、小程序安全、数据分析、硬件设备、直播、运维中心、插件管理...等

## Installation

```shell
gem install wx_miniprogram
```

## Usage

所有接口方法以!结尾的方法调用失败抛出ApiError异常。正常方法成功返回Response Hash实例，失败返回false。

```ruby
client = WxMiniprogram::Client.new("appid", "secret")
# 获取Token
client.get_access_token!
# 获取稳定版Token
client.get_stable_access_token!
# 刷新Token
client.refresh_access_token!
# 获取插件用户openpid
client.get_plugin_open_pid("openid")
# 检查加密信息
client.check_encrypted_data("encoded_str")

...

```
## Test

TODO

设置环境变量 WX_APPID 和 WX_SECRET

```shell
rspec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ranjiayu/wx_miniprogram.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
