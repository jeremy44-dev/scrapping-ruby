require 'nokogiri'
require 'open_uri_redirections'

def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(open(townhall_url))
  email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
  return email
end

def get_townhall_urls(region_url)
  page = Nokogiri::HTML(open(region_url))
  
  townhall_urls = page.xpath('//a[contains(@href, ".html")]')
  return townhall_urls
end

def get_townhall_emails(region_url)
  emails = []

  get_townhall_urls(region_url).each do |townhall_url|
    emails << get_townhall_email(townhall_url)
  end

  return emails
end