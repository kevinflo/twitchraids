require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

scheduler.every '5m' do
  Stream.get_sad_stream
end

scheduler.every '10s' do
  Stream.ping
end