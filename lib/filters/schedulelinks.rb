# vim: set ts=2 sw=2 et ai ft=ruby:

class ScheduleLinks < LinkProcessor
  identifier :schedulelinks

  protected

  def qualifies?(url)
    url =~ /^(speaker|event|track):/
  end

  def resolve(url)
    raise "URL #{url} does not match (speaker|event|track):" unless url =~ /^(speaker|event|track):(.+)$/
    t = $1
    a = $2

    if a =~ %r{^(\d+)/(.+)$} then
      y = $1.to_i
      a = $2
    else
      y = nil
    end

    if y.nil? or y >= 2013 then
      "/schedule/speaker/#{a}/"
    else
      "https://archive.fosdem.org/#{y}/schedule/#{t}/#{a}.html"
    end
  end

end
