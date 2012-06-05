# vim: set ts=2 sw=2 et ai ft=ruby:
#
class NewsFilter < Nanoc::Filter
  identifier :news
  type :text
  def run(content, params={})
    if content =~ /^(.+)---\s*MORE\s*---\s*$(.+)/m then
      $1 + $2
    elsif content =~ /^(.+)---\s*FULL\s*---\s*$(.+)/m then
      $2
    else
      content
    end
  end
end
