# vim: set ts=2 sw=2 et ai ft=ruby:

def decorate_interviews
  @items.select{|item| item.interview? }.each do |item|
    item[:kind] = 'interview'
    item[:title] = "Interview: #{item[:person]}:<br/>#{item[:topic]}" if item[:title].nil?
    item[:navtitle] = "#{item[:person]}: #{item[:topic]}"
    item[:nonav] = true
  end
end

