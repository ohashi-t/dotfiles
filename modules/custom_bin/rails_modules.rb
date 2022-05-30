def deep_group_by(obj)
  return nil if obj.blank?

  obj.group_by(&:first).
    to_h do |k, v|
      [
        k.to_sym,
        v.map { |t| t[1..].presence }.
          compact.
          then { |o| deep_group_by(o) },
      ]
    end
end

def to_module(obj, depth = 0)
  raise StandardError if depth > 50
  return nil unless obj

  space = "  " * depth
  obj.map do |k, v|
    "#{space}module #{k.to_s.camelize}\n#{to_module(v, depth + 1)}#{space}end\n"
  end.join("\n")
end

def make_paths(target_dir)
  target_dir.map do |obj|
    !obj.is_a?(Hash) ?
    obj.to_s :
    obj.map { |k, values| values.map { |v| "#{k}/#{v}" } }
  end.flatten
end

target_dir = [
  { app: [:controllers, :models, :workers, :loyalties, :helpers, :services] },
  :lib,
]

bbb = make_paths(target_dir).reduce([]) do |result, path|
  result | Dir.glob("#{path}/**/").
           map { |u| u.gsub(/#{path}\//, "") }.
           map { |o| o.gsub(/\/$/, "") }
end.reject(&:blank?)

files = make_paths(target_dir).reduce([]) do |result, path|
  result | Dir.glob("#{path}/**/*.rb").
           map { |u| u.gsub(/\..*$/, "") }.
           map { |u| u.gsub(/#{path}\//, "") }
end

ccc = (bbb - files).map{|o| o.split("/") }.
  then { |o| deep_group_by(o) }.
  then { |o| to_module(o) }

File.open(Rails.root.join("lib/rails_module_paths.rb"), "w") do |f|
  f.puts(ccc)
end
puts "finished!!!!"


