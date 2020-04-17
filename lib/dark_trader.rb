require 'nokogiri'
require 'open_uri_redirections'

def get_cryptos()
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  cryptos = []

  (1..200).each do |row_index|
    row = "/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[#{row_index}]"
    name = page.xpath(row + "/td[3]/div").text
    value = page.xpath(row + "/td[5]/a").text[1..-1].to_f # suppression du $
    #puts "#{name} : #{value}"

    crypto = Hash.new
    crypto[name] = value
    cryptos << crypto
  end

  return cryptos
end

if __FILE__ == $0
  puts get_cryptos()
end