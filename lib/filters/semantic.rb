# vim: set ts=2 sw=2 et ai ft=ruby:
# encoding: utf-8

module Fosdem
  class SemanticFilter < Nanoc::Filter
    type :text
    identifier :semantic

    def run(content, params = {})
      @item_rep = assigns[:item_rep] if @item_rep.nil?
      require 'nokogiri'

      doc = if content =~ /<html[\s>]/
              Nokogiri::HTML.parse(content)
            else
              Nokogiri::HTML.fragment(content)
            end
      doc.xpath('.//code').select { |e| e.element? and e.has_attribute? 'class' }.each do |code|
        code
          .attribute('class')
          .value.split(/\s+/)
          .map do |c|
          case c.to_sym
          when :file
            'file'
          when :dir
            'folder-close'
          when :host
            'globe'
          else
            nil
          end
        end
          .reject(&:nil?)
          .map { |i| %Q! <i class="icon-#{i.to_s}"></i>! }
          .each { |i| code.children.after(i) }
      end

      doc.to_xhtml
    end
  end
end

