# vim: set ts=2 sw=2 et ai ft=ruby fileencoding=utf-8:

module Fosdem
  class InterviewFilter < Nanoc::Filter
    identifier :interview
    type :text
    def run(content, params={})
      header = ""
      speakers = @item[:speaker]
      unless speakers.is_a? Enumerable
        speakers = [speakers]
      end
      speakers.each do |speaker|
        speaker_page = @items["/schedule/speaker/#{speaker}/"]
        photo = speaker_page[:photo] ? $item_by_id.fetch(speaker_page[:photo][:identifier]) : nil
        if photo
          header << "<img src='#{photo.path}' width='#{photo[:width]}' height='#{photo[:height]}' class='speaker-photo' alt='Photo of #{speaker_page[:name]}'/>"
        end
      end
      header << "<p>" 
      header << speaker_list(@item[:speaker], html=true)
      event = $item_by_id.fetch("/schedule/event/#{@item[:event]}/")
      header << " will give a talk about <a href='#{event.path}'>#{@item[:topic]}</a> at FOSDEM #{@item[:year]}.</p>\n"
      content = header.concat(content)
      content = content.gsub(%r{^<p>Q:\s*(.+?)</p>}m, '<h5><span class="label label-info">Q:</span> \1</h5>')

      unless params[:nolicense]
        content << '
<div class="interview-license">
<a rel="license" href="http://creativecommons.org/licenses/by/2.0/be/">
<img src="https://creativecommons.org/images/deed/by.png" alt="Creative Commons License">
</a>
<h6><a rel="license" href="http://creativecommons.org/licenses/by/2.0/be">Creative Commons License</a></h6>
<p>This interview is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/2.0/be">Creative Commons Attribution 2.0 Belgium License</a>.</p>
<!--
<rdf:RDF xmlns="http://web.resource.org/cc/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#">
  <Work rdf:about="">
    <license rdf:resource="http://creativecommons.org/licenses/by/2.0/be/" />
    <dc:type rdf:resource="http://purl.org/dc/dcmitype/Text" />
  </Work>
  <License rdf:about="http://creativecommons.org/licenses/by/2.0/be/">
    <permits rdf:resource="http://web.resource.org/cc/Reproduction"/>
    <permits rdf:resource="http://web.resource.org/cc/Distribution"/>
    <requires rdf:resource="http://web.resource.org/cc/Notice"/>
    <requires rdf:resource="http://web.resource.org/cc/Attribution"/>
    <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks"/>
  </License>
</rdf:RDF>
-->
</div>
'
      end

      # post-process questions by adding numbered anchors for direct URLs
      # to individual questions
      require 'nokogiri'
      doc = Nokogiri::HTML.fragment(content)
      doc.xpath(%#//h5#).each_with_index do |q, index|
        q.children.first.add_previous_sibling(%|<a name="q#{index + 1}"/>|)
        q.xpath(%#span[text()='Q:']#).wrap(%|<a href="#q#{index + 1}"></a>|)
      end
      content = doc.send("to_html")
      content
    end
  end
end
