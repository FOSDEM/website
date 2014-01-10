# vim: set ts=2 sw=2 et ai ft=ruby:

module Fosdem

  def first_speaker(item)
    if item[:speaker].is_a? Enumerable
      item[:speaker].first
    else
      item[:speaker]
    end
  end

  # Generate a list of speakers of an interview, with HTML links for each speaker.
  def speaker_list(item, html=false)
    if item[:speaker].is_a? Enumerable and item[:person].is_a? Enumerable and item[:speaker].length > 1 and item[:speaker].length == item[:person].length
      speakers = item[:speaker].zip(item[:person])
      first_speaker = speakers.shift
      last_speaker = speakers.pop
      list = String.new
      if html 
        list << "<a href='/schedule/speaker/#{first_speaker.first}'>#{first_speaker.last}</a>"
      else
        list << first_speaker.last
      end
      speakers.each do |speaker, person|
        if html
          list << ", <a href='/schedule/speaker/#{speaker}'>#{person}</a>"
        else
          list << ", person"
        end
      end
      if html
        list << " and <a href='/schedule/speaker/#{last_speaker.first}'>#{last_speaker.last}</a>"
      else
        list << " and #{last_speaker.last}"
      end
    else
      list = String.new
      if html
        list << "<a href='/schedule/speaker/#{item[:speaker]}'>#{item[:person]}</a>"
      else
        list << item[:person]
      end
    end
  end

  def decorate_interviews
    @items.select{|item| interview?(item) }.each do |item|
      item[:kind] = 'interview'
      item[:nonav] = true

      title = "Interview with #{speaker_list(item)}"
      title << "<br/>#{item[:topic]}" if item[:topic]
      item[:title] = title if item[:title].nil?

      navtitle = "#{speaker_list(item)}"
      navtitle << " - #{item[:topic]}" if item[:topic]
      item[:navtitle] = navtitle
    end
  end
end
