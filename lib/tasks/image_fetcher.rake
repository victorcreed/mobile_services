require 'open-uri'
require 'json'
require 'tempfile'

desc "Fetch Records"
task :image_fetcher => :environment do
  records = JSON.parse(open("http://megimage.heroku.com/gallery").read)
  records.each do |r|

    w = Widget.find_by_url(r['url'])
    if w.blank?

      #uploader = ImageUploader.new
     # uploader.store! File.open(r['url'])

      open("#{Rails.root}/tmp/image.png", 'wb') do |file|
        file << open(r['url']).read
      end
      widget = Widget.new(url: r['url'], posted_at: r['date'], content_type: r['content-type'] )
      widget.image = File.open("#{Rails.root}/tmp/image.png")

      puts "***************\n New Record Added #{ widget.save } \n ************************"
    end


  end
end