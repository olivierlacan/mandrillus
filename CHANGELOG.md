# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed
- Subclass StandardError instead of Exception ([PR](https://github.com/olivierlacan/mandrillus/pull/1))
for Mandrill::Error.
- Ship LICENSE, COPYRIGHT, README and CHANGELOG in the packaged gem.

### Added
- Test suite and GitHub Actions CI on every Ruby release from 2.3 to 4.0, against both the
  oldest and newest supported excon versions.
- Release workflow that publishes to RubyGems.org when a version tag is pushed.

## [2.0.0] - 2018-10-08

### Changed
- Forked the official but unmaintained mandrill-api gem.
- Support json gem 2.0+
