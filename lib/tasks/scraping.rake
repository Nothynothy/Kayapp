require 'open-uri'
require 'nokogiri'
require 'colorize'
require 'awesome_print'

def rivers_info(html_doc, rivers_url, rivers) # rubocop:disable Metrics/MethodLength
  html_doc.search('.liste_sites tr').each do |el|
    el.css('.nom_site a').each do |link|
      url = link['href'].to_s.downcase
      rivers_url << url
      rivers[url[/voir\/(.*$)/, 1]] = {}
    end
    el.search('td:nth-child(2)').each do |addres|
      rivers[rivers.keys.last] = {
        addres: addres.xpath('text()').to_s.strip.gsub("   &gt;   ", ",").split(','),
        topos: {}
      }
    end
  end
end

def topos_info(url, rivers) # rubocop:disable Metrics/MethodLength
  html_topo = URI.open("https://dev.eauxvives.org#{url}").read
  html_doc = Nokogiri::HTML(html_topo)
  river_name = url[/voir\/(.*$)/, 1]
  html_doc.search('#tableau_des_parcours tr').each do |data|
    name = data.search('td:nth-child(1)').xpath('text()').to_s.downcase
    length = data.search('td:nth-child(2)').xpath('text()').to_s
    level = data.search('td:nth-child(3)').xpath('text()').to_s
    if name != ""
      rivers[river_name][:topos].store(name.to_sym, [length, level])
      html_doc.search('#points_acces div').each do |point|
        rivers[river_name][:topos][name.to_sym] << point.xpath('text()').to_s.strip
      end
    end
  end
  puts "Found data - #{river_name}".green
end

def save_db(rivers)
  rivers.each do |k, v|
    topos = v[:topos]
    topos.each do |par, inf|
      topo = Topo.new(name: par, level: inf[1], length: inf[0])
    end
  end
end

def scrap(num) # rubocop:disable Metrics/MethodLength
  rivers_url = []
  rivers = {}
  list_url = 'https://dev.eauxvives.org/fr/rivieres/liste'
  html_list = URI.open(list_url).read
  html_doc = Nokogiri::HTML(html_list)
  rivers_info(html_doc, rivers_url, rivers)
  i = 0
  e = 0
  num = num == -1 ? rivers_url.count : num
  num.times do
    url = rivers_url[i]
    begin
      topos_info(url, rivers)
    rescue
      puts "Can't get data for #{river_name}".red
      e += 1
    ensure
      i += 1
    end
  end
  puts '-----------------'
  puts e.zero? ? "#{i} - River saved".green : "#{e} - River not found".red
  puts '-----------------'
  puts 'Save topos and rivers to the db...'
  save_db(rivers)
end


namespace :scraping do
  desc "Get 10 rivers info"
  task developement: :environment do
    scrap(10)
  end

  desc "Get all rivers info"
  task production: :environment do
    scrap(-1)
  end
end
