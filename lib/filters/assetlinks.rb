# vim: set ts=2 sw=2 et ai ft=ruby:

class AssetLinks < LinkProcessor
  identifier :assetlinks

  protected

  def qualifies?(url)
    url =~ /^asset:/
  end

  def resolve(url)
    raise "URL #{url} does not match asset:" unless url =~ /^asset:(.+)$/
    a = $1

    candidates = @items.select{|i| i.path =~ %r,^/assets(/.+?)?/#{a}\..+$,i}

    raise "Failed to find asset resource that matches \"#{a}\" (referenced as URL \"#{url}\" in #{@item.identifier})" if candidates.empty?
    raise "Found #{candidates.length} asset resource that match \"#{a}\" (referenced as URL \"#{url}\" in #{@item.identifier})" if candidates.length > 1

    return candidates[0].path
  end

end
