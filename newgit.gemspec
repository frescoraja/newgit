Gem::Specification.new do |s|
  s.name         = 'newgit'
  s.version      = '1.0.1a'
  s.date         = '2016-04-14'
  s.summary      = "New Github Repo from the command line"
  s.description  = "CLI Github Repo Generator written in Ruby"
  s.authors      = ["David James Carter"]
  s.email        = 'fresco.raja@gmail.com'
  s.add_runtime_dependency 'colorize',
    ['>= 0']
  s.files        = ["lib/newgit.rb", "bin/newgit"]
  s.executables  = ["newgit"]
end
