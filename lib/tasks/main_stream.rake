namespace :db do
  desc "Fill database with main stream"
  task populate: :environment do
    make_main_stream
  end
end

def make_main_stream
  main_stream = Stream.new()
  main_stream.save!
end