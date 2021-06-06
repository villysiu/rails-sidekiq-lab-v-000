class SongsWorker
    require 'csv'
    include Sidekiq::Worker
   
    def perform(songs_file)
      CSV.foreach(songs_file, headers: true) do |s|
        a = Artist.find_or_create_by(name: s[1])
      Song.find_or_create_by(title: s[0], artist_id: a.id)

             end
            
             
    end
  end