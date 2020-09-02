# vim: set ts=2 sw=2 et ai ft=ruby fileencoding=utf-8:

module Fosdem
  class TableOfContentsFilter < Nanoc::Filter
    type :text
    identifier :toc

    private

    class Node
      attr_reader :level, :text, :children, :parent, :origin
      def initialize(level, text, parent = nil, element = nil)
        @level = level
        @text = text
        @parent = parent
        @children = []
        @origin = element
        parent.add_child(self) if parent
      end

      def add_child(node)
        @children << node
      end

      def to_xhtml(attributes = {})
        attributes, maxdepth =
          if attributes.has_key? 'maxdepth'
            a = attributes.clone
            m = a.delete('maxdepth')
            [a, m.value.to_i]
          else
            [attributes, 2]
          end

        _to_xhtml([], maxdepth, attributes)
      end

      def numberize(attributes = {})
        maxdepth = if attributes.has_key? 'numberdepth'
                     attributes['numberdepth'].value.to_i
                   elsif attributes.has_key? 'maxdepth'
                     attributes['maxdepth'].value.to_i
                   else
                     9999
                   end
        _numberize([], maxdepth)
      end

      def anchorize(start = 1)
        _anchorize([])
      end

      protected

      def _to_xhtml(path, maxdepth, attributes)
        t = ""
        t << %Q!<li><a href="#toc-#{path.join('.')}">#{path.join('.')}. #{@text}</a>! if @text
        unless @children.empty? or path.size >= maxdepth
          if attributes.has_key? 'class'
            attributes['class'] << " toc-#{path.size}"
          else
            attributes['class'] = "toc-#{path.size}"
          end
          a = attributes.map { |k, v| %Q!#{k}="#{v}"! }.join(" ")
          t << "\n<ul #{a}>"
          @children.each_with_index do |c, i|
            t << c._to_xhtml(path + [i + 1], maxdepth, attributes)
          end
          t << "\n</ul>"
        end
        t << "</li>\n"
        t
      end

      def _numberize(path, maxdepth)
        if @origin
          @origin.inner_html = %Q!<span class="h-number">#{path.join('.')}</span>#{@origin.text}!
        end
        unless @children.empty? or path.size >= maxdepth
          @children.each_with_index do |c, i|
            c._numberize(path + [i + 1], maxdepth)
          end
        end
      end

      def _anchorize(path)
        if @origin
          @origin.add_previous_sibling(%Q!<a name="toc-#{path.join('.')}"></a>!)
        end
        @children.each_with_index do |c, i|
          c._anchorize(path + [i + 1])
        end
      end
    end

    public

    def run(content, params = {})
      @item_rep = assigns[:item_rep] if @item_rep.nil?
      require 'nokogiri'

      doc = if content =~ /<html[\s>]/
              Nokogiri::HTML.parse(content)
            else
              Nokogiri::HTML.fragment(content)
            end

      top = Node.new(0, nil)
      node = top
      toc = nil
      headings = doc.xpath('.//*').select do |h|
        if h.element?
          if h.name == 'toc'
            toc = h
            false
          elsif h.name =~ /^h(\d+)$/
            level = $1.to_i
            node =
              if level > node.level
                Node.new(level, h.text, node, h)
              elsif level == node.level
                node = Node.new(level, h.text, node.parent, h)
              else
                p = node.parent
                (1..(node.level - level)).each do |_|
                  p = p.parent
                end
                Node.new(level, h.text, p, h)
              end
            true
          else
            false
          end
        else
          false
        end
      end

      if toc
        attributes, numberize =
          if toc.attributes.has_key? 'numberize'
            a = toc.attributes.clone
            a.delete('numberize')
            [a, true]
          else
            [attributes, false]
          end

        if numberize
          if toc
            top.numberize(toc.attributes)
          else
            top.numberize
          end
        end

        top.anchorize
        toc.replace(top.to_xhtml(toc.attributes))
        doc.to_xhtml
      else
        top.to_xhtml + "\n" + doc.to_xhtml
      end
    end
  end
end
