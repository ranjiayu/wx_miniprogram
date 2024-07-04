# frozen_string_literal: true
require "wx_miniprogram"

RSpec.describe WxMiniprogram do

  before(:each) do
    @client = WxMiniprogram::Client.new(ENV["WX_APPID"], ENV["WX_SECRET"])
  end

  it "get_access_token" do
    resp = @client.get_access_token!
    expect(resp["access_token"]).not_to be nil
    expect(resp["expires_in"]).not_to be nil
    expect(@client.expired?).to eq false
    expect(@client.expire).to be >= Time.now.to_i
  end

  it "get_stable_access_token" do
    resp = @client.get_stable_access_token!
    expect(resp["access_token"]).not_to be nil
    expect(resp["expires_in"]).not_to be nil
    expect(@client.expired?).to eq false
    expect(@client.expire).to be >= Time.now.to_i
  end

  it "with_out_access_token" do
    # @client.get_access_token!
    expect {
      @client.check_encrypted_data!("123")
    }.to raise_error(WxMiniprogram::ApiError, "You must invoke 'get_access_token' method at first")
  end

  it "with_access_token" do
    expect {
      @client.get_access_token!
      @client.check_encrypted_data!("657edd868c9715a9bebe42b833269a557a48498785397a796f1568c29a200b2c")
    }.not_to raise_error(WxMiniprogram::ApiError, "You must invoke 'get_access_token' method at first")
  end



end
