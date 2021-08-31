class StatsForRiver < ApplicationService
  def initialize(river)
    @river = river
  end

  def call
    sites = ApiHubeauInfoSite.call(@river.name)
    sites.map! do |site|
      {
        name: site[:name],
        data: ApiHubeauDataSite.call(site[:code]),
      }
    end
    sites.each do |site|
      site[:data].each do |data|
        data[:date].gsub!(/[TZ]/, 'T' => '_', 'Z' => '')
        data[:level] = data[:level]/1000
      end
    end
    sites.reject do |site|
      site[:data].empty?
    end
  end
end
