# vim: set ts=2 sw=2 et ai ft=ruby:

class Nanoc::Item
  def navtitle
    if self[:navtitle] then
      self[:navtitle]
    elsif self[:title] then
      self[:title]
    else
      self.id.capitalize
    end
  end
  def interview?
    self[:kind] == 'interview' or self.identifier =~ %r{^/interviews?/.+}
  end
  def page?
    self[:kind] == 'page' or self.identifier.match(%r{^/(news|headlines|assets|sponsors?|schedule)/}).nil?
  end
  def news?
    self[:kind] == 'news' or self.identifier.match(%r{^/news/.+}).nil? ? false : true
  end
  def sponsor?
    self[:kind] == 'sponsor' or (self[:kind] != 'page' and not self.binary? and self.identifier.match(%r{^/sponsors?/.+/}).nil? ? false : true)
  end
  def disabled?
    self[:disabled]
  end
  def enabled?
    not self.disabled?
  end
  def id
    self.identifier.gsub(%r{/+$}, '').split('/')[-1]
  end
  def p
    self.identifier.gsub(%r{^/}, '').gsub(%r{/$}, '')
  end
  def pathparts
    p.split(%r{/+})
  end
end

