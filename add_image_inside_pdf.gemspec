lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "add_image_inside_pdf/version"

Gem::Specification.new do |spec|
  spec.name          = "add_image_inside_pdf"
  spec.version       = AddImageInsidePdf::VERSION
  spec.authors       = ["Ashish Prajapati"]
  spec.email         = ["ashishprajapati0404@gmail.com"]

  spec.summary       = %q{This gem provides ability to replace any text with image in pdfs.}
  spec.description   = %q{This gem is very efficient for the case when we need to replace any text with image within the pdfs. This gem also allows to replace multiple texts with any image in single call.}
  spec.homepage      = "https://github.com/ashishprajapati/add_image_inside_pdf"
  spec.license       = "MIT"
  
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "hexapdf", "~> 0.6.0"
end
