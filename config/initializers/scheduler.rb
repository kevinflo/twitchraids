require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new(:lockfile => ".rufus-scheduler.lock")


unless scheduler.down?
  scheduler.every '5m', :first_in => '10s' do
    Stream.get_sad_stream
  end
end

unless scheduler.down?
  scheduler.every '10s', :first_in => '30s' do
    Stream.ping
  end
end