require_relative '../lib/dark_trader'

describe "the get_cryptos function" do
  it "finds cryptos" do
    expect(get_cryptos.size).to eq(200)
    expect(get_cryptos[0]["BTC"].instance_of? Float).to eq(true)
  end
end
