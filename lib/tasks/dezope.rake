# -*- ruby -*-

require 'pathname'
require 'nokogiri'

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


namespace :zope do


  desc "Import tmp/stories.xml"
  task :stories => [:environment] do
    top=Pathname.new(__FILE__).dirname.dirname.dirname

    begin

      doc = nil
      (top + "tmp" + "stories.xml").open('r') do |fp|
        data = fp.read
        doc = Nokogiri::XML(data)
      end

      doc.xpath("//story").each do |story_xml|
        story = Story.new
        story.title = story_xml.xpath("./title").text
        story.author = story_xml.xpath("./author").text
        story.body = story_xml.xpath("./body").text.gsub(/<dtml[^>]+>/, '')
        story.updated_at = story_xml.xpath("./updated").text
        story.save!
      end

    rescue Exception => e
      puts "**ERROR**"
      puts e
      puts "/ERROR"
      raise
    end

  end


  desc "Import tmp/schedule.xml"
  task :schedule => [:environment] do
    top=Pathname.new(__FILE__).dirname.dirname.dirname

    begin

      doc = nil
      (top + "tmp" + "schedule.xml").open('r') do |fp|
        data = fp.read
        doc = Nokogiri::XML(data)
      end

      doc.xpath("//event").each do |meeting_xml|
        meeting = Meeting.new
        meeting.title = meeting_xml.xpath("./title").text
        meeting.topic = meeting_xml.xpath("./topic").text
        meeting.body = meeting_xml.xpath("./body").text
        meeting.date = meeting_xml.xpath("./date").text
        meeting.save!
      end

    rescue Exception => e
      puts "**ERROR**"
      puts e
      puts "/ERROR"
      raise
    end

  end
end
