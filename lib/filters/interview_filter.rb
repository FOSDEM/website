# vim: set ts=2 sw=2 et ai ft=ruby:
#
class InterviewFilter < Nanoc::Filter
  identifier :interview
  type :text
  def run(content, params={})
    content = content.gsub(%r{^<p>Q:\s*(.+?)</p>}m, '<h5><span class="label label-info">Q:</span> \1</h5>')

    unless params[:nolicense] then
        content << '
<div class="interview-license">
<img src="https://creativecommons.org/images/deed/by.png">
<h6><a href="http://creativecommons.org/licenses/by/2.0/be">Creative Commons License</a></h6>
<p>This interview is licensed under a <a href="http://creativecommons.org/licenses/by/2.0/be">Creative Commons Attribution 2.0 Belgium License</a>.</p>
</div>
'
    end

    content
  end
end
