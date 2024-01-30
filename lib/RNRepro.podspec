require "json"

Pod::Spec.new do |s|
  package = JSON.parse(File.read(File.join(File.dirname(__FILE__), "package.json")))

  s.name         = "RNRepro"
  s.version      = package["version"]
  s.source_files = "ios/**/*.{h,m,mm}"
  s.license      = "MIT"
  s.authors      = { "RNRepro" => "RNRepro" }
  s.summary      = "RNRepro"
  s.homepage     = "http://example.com"
  s.source       = { :git => "" }
  s.requires_arc = true
  s.platforms       = { ios: '11.0' }

  install_modules_dependencies(s);
end
