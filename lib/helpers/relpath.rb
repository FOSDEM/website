# vim: set ts=2 sw=2 et ai ft=ruby:

module Fosdem
  def relpath(from, to)
    raise "from may not be nil" if from.nil?
    raise "to may not be nil" if to.nil?

    require 'pathname'

    if to.is_a?(Nanoc::Item) then
      target = to.reps[0].path
    else
      target = to
    end

    src_path = Pathname.new(from)
    dst_path = Pathname.new(target)
    if src_path.to_s[-1,1] != '/'
      rp = dst_path.relative_path_from(src_path.dirname).to_s
    else
      rp = dst_path.relative_path_from(src_path).to_s
    end
    if dst_path.to_s[-1,1] == '/'
      rp << '/'
    end
    if rp =~ %r{^(.+)(#[^/]+)$} then
      rp = $1
      balise = $2
    else
      balise = nil
    end
    rp << balise unless balise.nil?
    rp
  end

  def expand_path(path)
    parts = path.split %r{/+}
    result = []
    parts.each do |part|
      if part == '.'
      elsif part == '..'
        result.pop
      else
        result << part
      end
    end
    result.join '/'
  end
end
