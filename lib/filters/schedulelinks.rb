# vim: set ts=2 sw=2 et ai ft=ruby:

class ScheduleLinks < LinkProcessor
  identifier :schedulelinks

  protected

  def qualifies?(url)
    url =~ /^(speaker|person|event|track|room):/
  end

  def resolve(url)
    raise "URL #{url} does not match (speaker|person|event|track|room):" unless url =~ /^(speaker|person|event|track|room):(.+)$/
    t = $1
    a = $2

    if a =~ %r{^(\d+)/(.+)$} then
      y = $1.to_i
      a = $2
    else
      y = nil
    end

    if y.nil? or y >= 2013 then
      case t
      when "speaker"
        "/schedule/speaker/#{a}/"
      when "person"
        "/schedule/speaker/#{a}/"
      when "event"
        "/schedule/event/#{a}/"
      when "track"
        "/schedule/track/#{a}/"
      when "room"
        "/schedule/room/#{a}/"
      else
        raise "unsupported schedule URL for type \"#{t}\""
      end
    else
      "https://archive.fosdem.org/#{y}/schedule/#{t}/#{a}.html"
    end
  end

end
