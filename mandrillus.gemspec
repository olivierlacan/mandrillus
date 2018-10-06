Gem::Specification.new do |s|
    s.name = 'mandrillus'
    s.version = '2.0.0'
    s.summary = 'A fork of the official Ruby API library for the Mandrillus email as a service platform.'
    s.description = s.summary
    s.authors = ['Mandrillus Devs', 'Olivier Lacan']
    s.email = ['community@mandrill.com', 'hi@olivierlacan.com']
    s.files = ['lib/mandrill.rb', 'lib/mandrill/api.rb', 'lib/mandrill/errors.rb']
    s.homepage = 'https://github.com/olivierlacan/mandrillus/'
    s.add_dependency 'json', '>= 1.7.7', '< 3.0'
    s.add_dependency 'excon', '>= 0.16.0', '< 1.0'
end
