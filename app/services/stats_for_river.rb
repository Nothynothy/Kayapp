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
    sites.reject do |site|
      site[:data].empty?
    end
  end
end
