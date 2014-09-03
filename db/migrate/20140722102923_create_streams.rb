class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.string :channel, :default => "medrybw"
      t.integer :starting_viewers, :default => 0
      t.string :game, :default => ""
      t.integer :twitch_id, :limit => 8, :default => 0
      t.integer :current_viewers, :default => 0

      t.timestamps
    end
  end
end
