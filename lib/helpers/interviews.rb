# vim: set ts=2 sw=2 et ai ft=ruby:

module Fosdem
  def decorate_interviews
    @items.select{|item| interview?(item) }.each do |item|
      item[:kind] = 'interview'
      item[:nonav] = true

      title = "Interview with #{item[:person]}"
      title << "<br/>#{item[:topic]}" if item[:topic]
      item[:title] = title if item[:title].nil?

      navtitle = "#{item[:person]}"
      navtitle << " - #{item[:topic]}" if item[:topic]
      item[:navtitle] = navtitle
    end
  end
end
