require 'open-uri'
require 'nokogiri'

list_url = 'https://www.eauxvives.org/fr/rivieres/liste'

html_list = URI.open(list_url).read
html_doc = Nokogiri::HTML(html_list)

rivers_url = []

html_doc.search('.nom_site a').each { |el| rivers_url << "https://www.eauxvives.org#{el['href']}" }

puts rivers_url
