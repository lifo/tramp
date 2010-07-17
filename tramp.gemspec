Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'tramp'
  s.version = '0.1'
  s.summary = "Async ORM layer."
  s.description = <<-EOF
    Tramp provides asynchronous ORM layer.
  EOF

  s.author = "Pratik Naik"
  s.email = "pratiknaik@gmail.com"
  s.homepage = "http://m.onkey.org"

  s.add_dependency('activesupport', '~> 3.0.0.beta4')
  s.add_dependency('activemodel',   '~> 3.0.0.beta4')
  s.add_dependency('arel',          '~> 0.4.0')
  s.add_dependency('mysqlplus',     '~> 0.1.1')

  s.files = Dir['README', 'MIT-LICENSE', 'lib/**/*']
  s.has_rdoc = false

  s.require_path = 'lib'
end
