# -*- ruby -*-

require 'pathname'
require 'nokogiri'
require 'kramdown'

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

  desc "Import old-site/stories.xml"
  task :stories => [:environment] do
    top=Pathname.new(__FILE__).dirname.dirname.dirname

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
        raw_html = story_xml.xpath("./body").text.gsub(/<dtml[^>]+>/, '')
        story.body = Kramdown::Document.new(raw_html, :input => 'html').to_kramdown
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
        meeting.topic = meeting_xml.xpath("./subtitle").text

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
end

task :zope => [:'zope:schedule', :'zope:stories']
