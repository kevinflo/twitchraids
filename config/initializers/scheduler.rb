require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new(:lockfile => ".rufus-scheduler.lock")


unless scheduler.down?
  scheduler.every '5m' do
    Stream.get_sad_stream
  end
end

unless scheduler.down?
  scheduler.every '10s' do
    Stream.ping
  end
end