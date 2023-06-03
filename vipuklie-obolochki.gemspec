# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vipuklie/obolochki/version"

Gem::Specification.new do |spec|
  spec.name = "vipuklie-obolochki"
  spec.version = Vipuklie::Obolochki::VERSION
  spec.authors = ["Daria Kolbasina, Anastasia Roy, Alexey Vasiliev"]
  spec.email = ["dkolbasina@sfedu.ru"]

  spec.summary = "This is a library for constructing convex hulls. It includes implementations of both the Jarvis and Graham algorithms."
  spec.description = "This is a library for constructing convex hulls. It includes implementations of both the Jarvis and Graham algorithms."
  spec.homepage = "https://github.com/dasha032/vipukliye-obolochki.git"
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dasha032/vipukliye-obolochki.git"
  spec.metadata["changelog_uri"] = "https://github.com/dasha032/vipukliye-obolochki.git"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
