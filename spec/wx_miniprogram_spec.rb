# frozen_string_literal: true

RSpec.describe WxMiniprogram do
  it "get_access_token" do
    client = WxMiniprogram::Client.new(ENV["WX_APPID"], ENV["WX_SECRET"])
    resp = client.get_access_token!
    expect(resp["access_token"]).not_to be nil
    expect(resp["expires_in"]).not_to be nil
    expect(client.expired?).to eq false
    expect(client.expire).to be >= Time.now.to_i
  end

  it "get_stable_access_token" do
    client = WxMiniprogram::Client.new(ENV["WX_APPID"], ENV["WX_SECRET"])
    resp = client.get_stable_access_token!(false)
    expect(resp["access_token"]).not_to be nil
    expect(resp["expires_in"]).not_to be nil
    expect(client.expired?).to eq false
    expect(client.expire).to be >= Time.now.to_i
  end

  # it "get_plugin_open_pid" do
  #   client = WxMiniprogram::Client.new(ENV["WX_APPID"], ENV["WX_SECRET"])
  #   client.get_access_token!
  #   code = "code"
  #   resp = client.get_plugin_open_pid!(code)
  #   expect(resp["openpid"]).not_to be nil
  #   expect(resp["errcode"]).to eq 0
  # end

  # it "check_encrypted_data" do
  #   encrypted_msg_hash = "657edd868c9715a9bebe42b833269a557a48498785397a796f1568c29a200b2c"
  #   client = WxMiniprogram::Client.new(ENV["WX_APPID"], ENV["WX_SECRET"])
  #   client.get_access_token!
  #   resp = client.check_encrypted_data!(encrypted_msg_hash)
  #   expect(resp["vaild"]).to be true

  #   encrypted_msg_hash = "sha2561"
  #   resp = client.check_encrypted_data!(encrypted_msg_hash)
  #   expect(resp["vaild"]).to be false
  # end

  # it "get_paid_unionid" do
  #   client = WxMiniprogram::Client.new(ENV["WX_APPID"], ENV["WX_SECRET"])
  #   client.get_access_token!
  #   resp = client.get_paid_unionid!({
  #     :openid         => "openid",
  #     :transaction_id => "transaction_id",
  #     :mch_id         => "mch_id",
  #     :out_trade_no   => "out_trade_no"
  #   })
  #   expect(resp["errcode"]).not_to be 0
  # end


end
