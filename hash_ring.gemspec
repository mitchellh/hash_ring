$gemspec = Gem::Specification.new do |s| 
  s.name = 'hash_ring'
  s.version = '0.1'
  s.authors = [ 'Mitchell Hashimoto' ]
  s.email = 'mitchell.hashimoto@gmail.com'
  s.homepage = 'http://github.com/mitchellh/hash_ring/'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Pure ruby implementation of consistent hashing, based on Amir Salihefendic\'s hash_ring in python.'
 
  s.require_path = 'lib'
  s.has_rdoc = false
  s.extra_rdoc_files = %w{ README.txt CREDITS.txt }
 
  s.files = Dir['lib/**/*.rb'] + Dir['*.txt']
end
