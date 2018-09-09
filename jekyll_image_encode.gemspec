Gem::Specification.new do |s|
  s.name        = 'jekyll_image_base64'
  s.version     = '0.0.4'
  s.date        = '2018-09-09'
  s.summary     = "Jekyll Image Base64"
  s.description = "Jekyll tag that converts images from the internet to base64"
  s.add_runtime_dependency "mimemagic", [">= 0.2.0"]
  s.authors     = ["GSI"]
  s.email       = 'rubygems.org@groovy-skills.com'
  s.files       = Dir.glob('lib/**/*') # `git ls-files`.split($/)
  s.homepage    = 'https://github.com/terminal/jekyll_image_encode'
  s.license     = 'MIT'
end
