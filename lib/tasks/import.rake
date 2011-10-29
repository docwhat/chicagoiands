# -*- ruby -*-

require 'pathname'
require 'nokogiri'
require 'kramdown'
require 'date'

### Fix "Smart Quotes"
## This is a blunt force method of
## fixing smart quotes. It's a horrible hack.
#def fix_stupid_quotes!(s)
#  s.force_encoding "BINARY"
#  s.gsub!(/\x82/,',')
#  s.gsub!(/\x84/,',,')
#  s.gsub!(/\x85/,'...')
#  s.gsub!(/\x88/,'^')
#  s.gsub!(/\x89/,'o/oo')
#  s.gsub!(/\x8b/,'<')
#  s.gsub!(/\x8c/,'OE')
#  s.gsub!(/\x91|\x92/,"'")
#  s.gsub!(/\x93|\x94/,'"')
#  s.gsub!(/\x95/,'*')
#  s.gsub!(/\x96/,'-')
#  s.gsub!(/\x97/,'--')
#  s.gsub!(/\x98/,'~')
#  s.gsub!(/\x99/,'TM')
#  s.gsub!(/\xa9/,'(C)')
#  s.gsub!(/\x9b/,'>')
#  s.gsub!(/\x9c/,'oe')
#  s.gsub!(/\xe7/,'c')
#  s.gsub!(/[\xc4\xf4\xa0\xe9]/, "")
#  s.force_encoding "UTF-8"
#end

namespace :import do

  desc "Import old-site/stories.xml"
  task :stories => [:environment] do
    top=Pathname.new(__FILE__).dirname.dirname.dirname
    used = Set.new

    begin

      doc = nil
      (top + "old-site" + "stories.xml").open('r') do |fp|
        data = fp.read
        doc = Nokogiri::XML(data)
      end

      doc.xpath("//story").each do |story_xml|
        title = story_xml.xpath("./title").text
        story = Story.find_by_title title
        story = Story.new unless story

        puts " * story: #{title}"
        story.title = title
        story.author = story_xml.xpath("./author").text

        body = Nokogiri::XML("<rootnode>#{story_xml.xpath("./body").text}</rootnode>")
        allowed = ['p', 'h1', 'h2', 'h3', 'h4', 'h5', 'tt', 'pre', 'cite', 'em', 'strong', 'i', 'a', 'b', 'br']
        body.xpath('/rootnode//*').each do |el|
          el.name = el.name.downcase
          unless allowed.include? el.name
            used.add(el.name)
            el.children.each { |x| x.parent = el.parent }
            el.unlink
          end
        end
        body_str = body.xpath('/rootnode/*').to_s
        story.body = Kramdown::Document.new(body_str, :input => 'html').
          to_kramdown.
          gsub(/\\\"/, '"').
          gsub(/\\\'/, "'").
          gsub(/\\\#/, "#")

        story.updated_at = story_xml.xpath("./updated").text
        story.save!

      end

    rescue Exception => e
      puts "**ERROR**"
      puts e
      puts "/ERROR"
      raise
    end

    puts "imported old-site/stories.xml"
  end


  desc "Import old-site/schedule.xml"
  task :schedule => [:environment] do
    top=Pathname.new(__FILE__).dirname.dirname.dirname

    begin

      doc = nil
      (top + "old-site" + "schedule.xml").open('r') do |fp|
        data = fp.read
        doc = Nokogiri::XML(data)
      end

      doc.xpath("//event").each do |meeting_xml|
        title = meeting_xml.xpath("./title").text
        date = meeting_xml.xpath("./date").text
        topic = meeting_xml.xpath("./subtitle").text

        meeting = Meeting.find_by_date date
        meeting = Meeting.new unless meeting

        puts " * meeting: #{date} -- #{title}"

        meeting.title = title
        meeting.topic = Nokogiri::HTML(topic).text

        raw_html = meeting_xml.xpath("./body").text
        meeting.body = Kramdown::Document.new(raw_html, :input => 'html').to_kramdown

        meeting.date = date
        meeting.save!
      end

    rescue Exception => e
      puts "**ERROR**"
      puts e
      puts "/ERROR"
      raise
    end

    puts "imported old-site/schedule.xml"
  end

  task :dvds => [:environment] do
    top=Pathname.new(__FILE__).dirname.dirname.dirname
    begin
      doc = nil
      (top + "old-site" + "dvds.list").open('r') do |fp|
        fp.readlines.each do |line|
          date = Date.parse line.chomp

          meeting = Meeting.find_by_date(date)
          if meeting
            meeting.has_dvd = true
            meeting.save!
          end
        end
      end
    rescue Exception => e
      puts "**ERROR**"
      puts e
      puts "/ERROR"
      raise
    end

    puts "dvd flags are set"
  end

end

task :import => [:'import:schedule', :'import:stories', :'import:dvds']
