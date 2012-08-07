# vim: set ts=2 sw=2 et ai ft=ruby:

def asset(path)
  selector = begin
               name, ext = if path.include? "."
                             parts = path.split(".")
                             name = parts[0..-2].join(".")
                             ext = parts[-1]
                             [name, ext]
                           else
                             [path, '.+']
                           end
               lambda {|i| i.path =~ %r,^/assets(/.+?)?/#{name}\.#{ext}$,i or (i[:filename] and i[:filename] =~ %r,^content/assets(/.+?)?/#{name}\.#{ext}$,i)}
             end

  candidates = @items.select(&selector)

  raise "Failed to find asset resource that matches \"#{path}\" (in #{@item.identifier})" if candidates.empty?
  raise "Found #{candidates.length} asset resource that match \"#{path}\" (in #{@item.identifier})" if candidates.length > 1

  candidates.first
end

class AssetLinks < LinkProcessor
  identifier :assetlinks

  protected

  def qualifies?(url)
    url =~ /^asset:/
  end

  def resolve(url)
    raise "URL #{url} does not match asset:" unless url =~ /^asset:(.+)$/
    asset($1).path
  end

end
