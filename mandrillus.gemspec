Gem::Specification.new do |s|
    s.name = 'mandrillus'
    s.version = '2.0.0'
    s.licenses = ['Apache-2.0']
    s.summary = 'A fork of the official Ruby API library for the Mandrill email as a service platform.'
    s.description = 'Ruby client for the Mandrill (Mailchimp Transactional) API. ' \
                    'Maintained fork of the unmaintained official mandrill-api gem.'
    s.authors = ['Olivier Lacan']
    s.email = ['hi@olivierlacan.com']
    s.files = ['lib/mandrill.rb', 'lib/mandrill/api.rb', 'lib/mandrill/errors.rb',
               'LICENSE', 'COPYRIGHT', 'README.md', 'CHANGELOG.md']
    s.homepage = 'https://github.com/olivierlacan/mandrillus/'
    s.metadata = {
        'source_code_uri' => 'https://github.com/olivierlacan/mandrillus',
        'changelog_uri' => 'https://github.com/olivierlacan/mandrillus/blob/master/CHANGELOG.md',
        'bug_tracker_uri' => 'https://github.com/olivierlacan/mandrillus/issues'
    }
    s.add_dependency 'json', '>= 1.7.7', '< 3.0'
    s.add_dependency 'excon', '>= 0.16.0', '< 1.0'
end
