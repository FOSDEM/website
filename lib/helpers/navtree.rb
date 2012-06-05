# vim: set ts=2 sw=2 et ai ft=ruby:
module NavTreeHelper

  class Error < RuntimeError; end

  class Node
    def initialize(item, parent)
      @parent = parent
      @children = {}
      if item.is_a?(String) then
        @item = nil
        @path = item
        @name = item.split('/')[-1]
      else
        @item = item
        @path = item.path
        @name = item.navtitle
      end
    end
    def parent?
      not @parent.nil?
    end
    def parent
      @parent
    end
    def active?(p)
      if self.item? then
        p == item.path
      else
        p.start_with?(@path)
      end
    end
    def children=(children)
      @children = children
    end
    def name
      @name
    end
    def path
      @path
    end
    def item
      @item
    end
    def item?
      not @item.nil?
    end
    def set(name, item)
      @children[name] = item
    end
    def [](name)
      @children.fetch(name)
    end
    def []=(name, item)
      @children[name] = item
    end
    def child?(name)
      @children.has_key?(name)
    end
    def leaf?
      @children.empty?
    end
    def children
      @children.values
    end
    def index
      @children
    end
    def to_s
      "Node(item=#{@item.identifier}, children=#{@children})"
    end
  end

	def navtree
		require 'builder'

    rootitem = nil
    begin
      roots = @items.select { |item| item.identifier == '/' }
      raise Error, "failed to find the root item" if roots.empty?
      raise Error, "found #{roots.length} root items" if roots.length > 1
      rootitem = roots[0]
    end

    root = Node.new(rootitem, nil)

    @items.reject { |i| i[:is_hidden] or i[:nonav] or i.binary? or i[:title].nil? or not i.page? }.sort_by {|item| item.identifier }.each do |item|
      parts = item.pathparts
      raise Error, ":nav has more than two levels: \"#{item.identifier}\"" if parts.length > 2

      store = root
      parts.each_with_index do |part, index|
        if index == parts.length - 1 then
          child = Node.new(item, store)
          if store.child?(part) then
            child.children = store[part].index
          end
          store[part] = child
          store = store[part]
        elsif store.child?(part) then
          store = store[part]
        else
          child = Node.new(part, store)
          store[part] = child
          store = store[part]
        end
      end
    end

    def walk(xml, node)
      classes = []
      href = nil
      if node.item? and node.item.path then
        href = relpath(@item_rep.path, node.item.path)
      end
      title = node.item? ? node.item[:title] : nil
      classes << 'active' if node.item? and node.active?(@item_rep.path)
      classes << 'nav-header' if (node.item? and node.item[:navcat]) or not node.item?
      c = {}
      c[:class] = classes.join(" ") unless classes.empty?

      xml.li(c) do
        if not href.nil? then
          xml.a(:href => href) do
            xml.text! node.name
            xml.span(node.item[:navorder] ? node.item[:navorder].to_s : "*100", :class=>"badge")
          end
        else
          xml.text! node.name.capitalize
        end
      end
      node.children.sort_by{|child| (child.item? and child.item[:navorder]) ? child.item[:navorder] : 100 }.each do |child|
        walk(xml, child)
      end
    end

    buffer = ''
		xml = Builder::XmlMarkup.new(:target => buffer, :indent => 2)
    walk(xml, root)

    buffer
	end

end
