# mandrillus ![Gem][version]

A fork of the [unmaintained][unmaintained] official [Ruby API library][mandrill-api]
for the Mandrill email as a service platform.

[mandrill-api]: https://rubygems.org/gems/mandrill-api
[unmaintained]: https://rubygems.org/gems/mandrill-api/versions
[version]: https://img.shields.io/gem/v/mandrillus

## Development

CI tests every minor Ruby release from 2.3 to 4.0. The gemspec declares no
minimum Ruby version, so nothing older is excluded.

```sh
bundle install
bundle exec rake test
```

To test against a specific excon version (CI checks the newest allowed and the
gemspec's lower bound):

```sh
EXCON_VERSION="= 0.16.0" bundle update excon
EXCON_VERSION="= 0.16.0" bundle exec rake test
```

## Releasing

Releases are published to RubyGems.org by the [Release workflow](.github/workflows/release.yml)
when a version tag is pushed:

1. Bump `s.version` in `mandrillus.gemspec` and move the `Unreleased` CHANGELOG
   entries under the new version.
2. Merge to `master`, then tag and push: `git tag v2.0.1 && git push origin v2.0.1`.

The workflow runs the full test matrix, checks that the tag matches the gemspec
version, then builds and pushes the gem using the `RUBYGEMS_API_KEY` secret of
the `rubygems` environment.
