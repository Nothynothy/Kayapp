# CCC = []

# def fill_random_image
#   url = URI("https://api.unsplash.com/search/photos/?client_id=_VHzHxfpY4G4UfEfQsg42fp3LdvNko_8IZPFDL9_O9I&query=kayak&per_page=1000")

#   https = Net::HTTP.new(url.host, url.port)
#   https.use_ssl = true

#   request = Net::HTTP::Get.new(url)

#   response = https.request(request)
#   ap JSON.parse(response.read_body)
#   data = JSON.parse(response.read_body)["results"]
#   data.each do |image|
#     CCC << image["urls"]["small"]
#   end
# end


# fill_random_image

# Topo.all.each do |topo|
#   topo.update(image_url: CCC.sample)
# end




topos = Topo.levels(["1", "4"])

ap topos.count
