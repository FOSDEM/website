# vim: set ts=2 sw=2 et ai ft=ruby:

def locate_item_by_identifier(identifier, items=@items)
    q = identifier
    q.insert(0, '/') unless q[0,1] == '/'
    q << '/' unless q[-1,1] == '/'
    l = items.select{|item| item.identifier == q}
    raise "failed to find an item that matches the identifier #{q}" if l.empty?
    raise "found more than one item that matches the identifier #{q}: #{l}" if l.length > 1
    return l[0]
end

def locate_item_by_filename(filename, items=@items)
    l = items.select{|item| not item[:filename].nil? and item[:filename] == filename}
    raise "failed to find an item that matches the filename #{filename}" if l.empty?
    raise "found more than one item that matches the filename #{filename}: #{l}" if l.length > 1
    return l[0]
end

