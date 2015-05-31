require 'rubygems'
require 'rufus/scheduler'
require 'rake'
scheduler = Rufus::Scheduler.new

scheduler.every '10m', :first_in=>'3s' do
  system('rake weather:scrape_bom')
end

scheduler.every '150m' do
  system('rake weather:scrape_forecast')
end
