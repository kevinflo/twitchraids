class Stream < ActiveRecord::Base
  def self.ping
    tbase = "https://api.twitch.tv/kraken/"
    pinged = HTTParty.get(tbase + "streams/" + Stream.last.channel)
    Stream.last.update(current_viewers:pinged["stream"]["viewers"].to_i)
  end
  
  def self.get_sad_stream
    tbase = "https://api.twitch.tv/kraken/"
    offset = 500
    streams = []

    dis = Hash.new { |hash, key| hash[key] = [] }
    (1..15).each do
      query = HTTParty.get(tbase+"streams?limit=100&offset="+offset.to_s)
      offset += 100
      
      query["streams"].each do |s|
        streams << s
      end
      # puts "calling for streams..."
    end


    streams.each do |s|
      dis[s["channel"]["display_name"].to_s] = [s["viewers"].to_i, s["channel"]["game"].to_s, s["_id"].to_i]
    end
    streams2 = []

    dis.each do |d|
      streams2 << d
    end
    found = streams2[rand(streams2.count-1)]
    Stream.create(channel:found[0], starting_viewers:found[1][0], game:found[1][1], twitch_id:found[1][2], current_viewers:found[1][0])
  end
end
