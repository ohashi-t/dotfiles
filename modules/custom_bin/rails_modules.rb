# rails runner ****/dotfiles/modules/custom_bin/rails_modules.rb

# tips: moduleを生成したいパスをkey/valueで指定する
def target_dir
  [
    {
      app: [
        :controllers,
        :models,
        :workers,
        :loyalties,
        :helpers,
        :services
      ]
    },
    :lib,
  ]
end

def deep_group_by(obj, depth = 0)
  raise StandardError if depth > 50
  return nil if obj.blank?

  obj.group_by(&:first).
    transform_keys(&:to_sym).
    transform_values { |v| v.filter_map { |t| t[1..].presence }.then { |o| deep_group_by(o, depth + 1) } }
end

def to_module(obj, depth = 0)
  raise StandardError if depth > 50
  return nil unless obj

  space = "  " * depth
  obj.map do |k, v|
    "#{space}module #{k.to_s.camelize}\n#{to_module(v, depth + 1)}#{space}end\n"
  end.join("\n")
end

# TODO: 再帰に変更してネストされたパスに対応する
def make_paths(target_dir)
  target_dir.map do |obj|
    obj.is_a?(Hash) ?
    obj.map { |k, values| values.map { |v| "#{k}/#{v}" } } :
    obj.to_s
  end.
  flatten
end

def dir_paths
  make_paths(target_dir).reduce([]) do |result, path|
    result | Dir.glob("#{path}/**/").
             map { |o| o.gsub(/#{path}\//, "") }.
             map { |o| o.gsub(/\/$/, "") }
  end.reject(&:blank?)
end

def file_paths
  make_paths(target_dir).reduce([]) do |result, path|
    result | Dir.glob("#{path}/**/*.rb").
             map { |o| o.gsub(/\..*$/, "") }.
             map { |o| o.gsub(/#{path}\//, "") }
  end
end

def target_modules
  (dir_paths - file_paths).
    map { |o| o.split("/") }.
    then { |o| deep_group_by(o) }.
    then { |o| to_module(o) }
end

#File.open(Rails.root.join("lib/rails_module_paths.rb"), "w") do |f|
#  f.puts(target_modules)
#end
puts target_modules
#puts "finished!!!!"


