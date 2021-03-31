class StaticPagesController < ApplicationController
  #require 'flickraw'
  def home
    begin
      @name = params["flickr_name"] rescue nil
      @id = params["flickr_id"] rescue (puts "no id found".red)
      flickr = Flickr.new# rescue nil
      p @name
      if @name
        @id = flickr.people.findByEmail(find_email: "rathersilly@live.com").id
        @id = flickr.people.findByUsername(username: "rathersilly").id
        p @id
        puts "----".green
      elsif @id
      else
        @id = ENV['FLICKR_ID']
      end

      #puts @id.green
      #puts system('env')
      #flickr = FlickRaw::Flickr.new(ENV["FLICKR_API_KEY"],ENV["FLICKR_SHARED_SECRET"])
      #p ENV['FLICKR_API_KEY']
      #puts ENV['FLICKR_SHARED_SECRET'].yellow

      if flickr

        #p flickr
        @list = flickr.photos.getRecent
        #p @list
        #p @list[0]
        #p @list[0].class
      end
      p @id
      puts @id.to_s.blue
      @pics = flickr.people.getPhotos(user_id: @id)
      p @pics

    #rescue
      #puts "flickr not created".red
    end
  end
end
