Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
 
  s.name = 'hash_ring'
  s.version = '0.1'
  s.date = '2009-03-04'
 
  s.description = "hash_ring implementation in Ruby"
  s.summary = "Consistent hashing implemented in Ruby"
 
  s.authors = ["Mitchell Hashimoto"]
  s.email = "mitchell.hashimoto@gmail.com"

  s.extra_rdoc_files = %w[README.rdoc LICENSE]
 
  s.has_rdoc = true
  s.homepage = 'http://github.com/mitchellh/hash_ring/'
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "hash_ring", "--main", "README.rdoc"]
  s.require_paths = %w[lib]
  s.rubygems_version = '0.1'

  s.files = %w[
    CREDITS
    LICENSE
    README.rdoc
    Rakefile
    lib/hash_ring.rb
    spec/spec_base.rb
    spec/hash_ring_spec.rb
  ] 
end
