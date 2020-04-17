require 'nokogiri'
require 'open_uri_redirections'

def get_depute_pages()
  page_list = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
  depute_relative_blocks = page_list.xpath('//div[@class="list_table"]//a')
  depute_pages = []
  depute_relative_blocks.each do |x|
    depute_pages << "https://www.nosdeputes.fr" + x['href']
  end

  return depute_pages
end

def depute_page_to_hash(depute_url)
  page_depute = Nokogiri::HTML(open(depute_url))
  email_rows = page_depute.xpath('//a[contains(@href,"mailto")]')
  email = email_rows[0].text
  name_domain = email.split("@")

  if name_domain.first.include? "."
    name = name_domain.first.split(".")
  else
    name_fr = name_domain.last.split(".")
    name = name_fr.first.split("-")
  end

  first_name = name.first
  last_name = name.last
  
  hash = Hash.new
  hash["first_name"] = first_name.capitalize
  hash["last_name"] = last_name.capitalize
  hash["email"] = email

  puts hash

  return hash
end

def get_depute_hashs()
  hashs = []

  get_depute_pages.each do |depute_page|
    begin
      hash = depute_page_to_hash(depute_page)
      hashs << hash
    rescue => e
      puts "extraction ratée sur la page : #{depute_page}"
    end
  end

  return hashs
end

if __FILE__ == $0
  get_depute_hashs().each do |hash|
    puts hash
  end
end