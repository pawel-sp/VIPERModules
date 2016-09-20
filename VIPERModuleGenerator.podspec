Pod::Spec.new do |s|
  s.name         = "ViperModuleGenerator"
  s.version      = "0.1"
  s.summary      = "ViperModuleGenerator"
  s.homepage     = "https://bitbucket.org/pawel-sp/vipermodulegenerator/"
  s.license      = "MIT"
  s.author       = { "Paweł Sporysz" => "pawel.s@untitledkingdom.co" }
  s.source       = { :git => "https://bitbucket.org/pawel-sp/vipermodulegenerator/" }
  s.source_files = "VIPERModules/*.{swift}"
end