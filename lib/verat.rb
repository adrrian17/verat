lib = File.expand_path('../', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

module Verat
  autoload :VERSION, 'verat/version'
  autoload :Feature, 'verat/feature'
  autoload :Hotfix,  'verat/hotfix'
end
