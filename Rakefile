require 'rake'
require 'rake/clean'
require 'rake/packagetask'
require 'rake/gempackagetask'
require 'spec/rake/spectask'

load 'hash_ring.gemspec'

###################################
# Clean & Defaut Task
###################################
CLEAN.include('pkg','tmp','rdoc')
task :default => [:clean, :repackage]

###################################
# Specs
################################### 
desc "Run all specs for hash_ring"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
end

###################################
# Packaging
################################### 
Rake::GemPackageTask.new($gemspec) do |pkg|
end
 
Rake::PackageTask.new('hash_ring', '0.1') do |pkg|
  pkg.need_zip = true
  pkg.package_files = FileList[
    'Rakefile',
    '*.txt',
    'lib/**/*',
    'spec/**/*'
  ].to_a

  class << pkg
    def package_name
      "#{@name}-#{@version}-src"
    end
  end
end