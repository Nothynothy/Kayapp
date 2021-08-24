require 'open-uri'
require 'nokogiri'
require 'colorize'
require 'awesome_print'

list_url = 'https://www.eauxvives.org/fr/rivieres/liste'

html_list = URI.open(list_url).read
html_doc = Nokogiri::HTML(html_list)

rivers_url = []
rivers = {}

u = 0
html_doc.search('.liste_sites tr').each do |el|
  el.css('.nom_site a').each do |link|
    url = link['href'].to_s.downcase
    rivers_url << url
    rivers[url[/voir\/(.*$)/, 1]] = {}
  end
  el.search('td:nth-child(2)').each do |addres|
    data = addres.xpath('text()').to_s.strip
    rivers[rivers.keys.last] = { addres: data.gsub("   &gt;   ", ",").split(',') }
    u += 1
  end
end

i = 1
e = 0
2.times do
  # begin
    html_topo = URI.open("https://www.eauxvives.org#{rivers_url[i]}").read
    html_doc = Nokogiri::HTML(html_topo)
    # Get value of name length and level
    url = rivers_url[i]
    river_name = url[/voir\/(.*$)/, 1]

    html_doc.search('#tableau_des_parcours tr').each do |data|
      name = data.search('td:nth-child(1)').xpath('text()').to_s.downcase
      length = data.search('td:nth-child(2)').xpath('text()').to_s
      level = data.search('td:nth-child(3)').xpath('text()').to_s
      if name != ""
        rivers[river_name].store(name.to_sym, [length, level])
        html_doc.search('#points_acces div').each do |point|
          rivers[river_name][name.to_sym] << point.xpath('text()').to_s.strip
        end
        presentation = html_doc.search('.rubrique')[1]
        logistique = html_doc.search('.rubrique')[-2]
        ap logistique
      end
    end
    # ap rivers[river_name]
    # Get information about topos
    puts "#{rivers_url[i]} - Saved!".green
    i += 1
  # rescue
  #   puts "Can't get informations for #{rivers_url[i]}".red
  #   e += 1
  # ensure
  #   i += 1
  # end
end

puts e.zero? ? "#{e} - River not found".green : "#{e} - River not found".red
