require_relative '../lib/cher_depute'

describe "the depute_page_to_hash function" do
  depute_page = "https://www.nosdeputes.fr/damien-abad"

  it "first_name extraction example" do
    first_name = "Damien"
    expect(depute_page_to_hash(depute_page)["first_name"]).to eq(first_name)
  end

  it "last_name extraction example" do
    last_name = "Abad"
    expect(depute_page_to_hash(depute_page)["last_name"]).to eq(last_name)
  end

  it "email extraction example" do
    # ordre imprévisible : VDM
    emails = ["damien.abad@assemblee-nationale.fr", "contact@damien-abad.fr"]
    expect(emails.include? depute_page_to_hash(depute_page)["email"]).to eq(true)
  end
end