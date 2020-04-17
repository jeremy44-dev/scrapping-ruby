require_relative '../lib/mairie_christmas'

describe "the get_townhall_email function" do
  it "returns avernes email" do
    townhall_url = "https://annuaire-des-mairies.com/95/avernes.html"
    townhall_email = "mairie.avernes@orange.fr"
    expect(get_townhall_email(townhall_url)).to eq(townhall_email)
  end
end

describe "the get_townhall_urls function" do
  it "returns townhall all urls" do
    region_url = "https://annuaire-des-mairies.com/val-d-oise.html"
    expect(get_townhall_urls(region_url).size).to eq(185)
  end

  it "returns townhall complete urls" do
    region_url = "https://annuaire-des-mairies.com/val-d-oise.html"
    townhall_url_format = "https://annuaire-des-mairies.com/95/"
    expect(get_townhall_urls(region_url)[0][0..39]).to eq(townhall_url_format)
  end
end

describe "the get_townhall_emails function" do
  it "returns doesn't return empty email" do
    region_url = "https://annuaire-des-mairies.com/val-d-oise.html"
    expect(get_townhall_emails(region_url).include? "").to eq(false)
  end
end