# vim: set ts=2 sw=2 et ai ft=ruby:

module Fosdem
  # We need the first speaker for sorting the interviews.
  def first_speaker(speakers)
    if speakers.is_a? Enumerable
      speakers.first
    else
      speakers
    end
  end

  def speaker_string(speaker, name, separator = "", html = false)
    if html
      "#{separator}<a href='/schedule/speaker/#{speaker}'>#{name}</a>"
    else
      "#{separator}#{name}"
    end
  end

  # Generate a human-readable list of speakers of an interview, with HTML links for each speaker.
  def speaker_list(speakers, html = false)
    if speakers.is_a? Enumerable and speakers.length > 1
      # Create pairs of [speaker slug, speaker name].
      pairs = speakers.map { |s| [s, @items["/schedule/speaker/#{s}/"][:name]] }
      # Remove the first and last speaker, they get treated separately.
      first_speaker = pairs.shift
      last_speaker = pairs.pop
      # First speaker gets no separator.
      list = speaker_string(first_speaker.first, first_speaker.last, "", html)
      # Use a comma as separator for the rest of the speakers.
      pairs.each do |speaker, name|
        list << speaker_string(speaker, name, ", ", html)
      end
      # Use " and " as separator for the last speaker.
      list << speaker_string(last_speaker.first, last_speaker.last, " and ", html)
    else
      list = speaker_string(first_speaker(speakers), @items["/schedule/speaker/#{first_speaker(speakers)}/"][:name], "", html)
    end
  end

  def decorate_interviews
    @items.select { |item| interview?(item) }.each do |item|
      item[:kind] = 'interview'
      item[:nonav] = true

      speakers = speaker_list(item[:speaker])
      title = "Interview with #{speakers}"

      event = @items["/schedule/event/#{item[:event]}/"]
      item[:topic] = event[:subtitle].nil? ? event[:title] : [event[:title], event[:subtitle]].join(". ")
      title << "<br/>#{item[:topic]}" if item[:topic]
      item[:title] = title if item[:title].nil?

      navtitle = "#{speakers}"
      navtitle << " - #{item[:topic]}" if item[:topic]
      item[:navtitle] = navtitle
    end
  end
end
