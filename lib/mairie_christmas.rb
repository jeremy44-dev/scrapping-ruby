require 'nokogiri'
require 'open_uri_redirections'

def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(open(townhall_url))
  
  begin
    email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
  rescue => e
    puts "parse error on #{townhall_url}"
    email = ""
  end

  return email
end

def get_townhall_urls(region_url)
  page = Nokogiri::HTML(open(region_url))
  townhall_urls_row = page.xpath("//a[@class='lientxt']")

  townhall_urls = []
  townhall_urls_row.each do |value|
    townhall_url = value['href']
    townhall_url[0] = "https://annuaire-des-mairies.com"
    townhall_urls << townhall_url
  end

  return townhall_urls
end

def get_townhall_emails(region_url)
  emails = []

  get_townhall_urls(region_url).each do |townhall_url|
    email = get_townhall_email(townhall_url)
    if email != ""
      emails << email
    end
    #puts townhall_url + " -> " + email
  end

  return emails
end

if __FILE__ == $0
  puts get_townhall_emails("https://annuaire-des-mairies.com/val-d-oise.html")
end