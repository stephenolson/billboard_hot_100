lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "billboard_hot_100/version"

Gem::Specification.new do |spec|
  spec.name          = "billboard_hot_100_CLI"
  spec.version       = BillboardHot100::VERSION
  spec.authors       = ["Stephen Olson"]
  spec.email         = ["stephenolson@gmail.com"]

  spec.summary       = %q{"This gem allows users to access the current weeks Billboard Hot 100."}
  spec.description   = %q{Access the current weeks Billboard Hot 100. Select a song to see additional information.}
  spec.homepage      = "https://github.com/stephenolson/billboard_hot_100"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ['billboard_hot_100']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", "~> 0"
end