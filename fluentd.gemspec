require File.expand_path('../lib/fluent/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "fluentd"
  gem.version       = Fluent::VERSION # see lib/fluent/version.rb

  gem.authors       = ["Sadayuki Furuhashi"]
  gem.email         = ["frsyuki@gmail.com"]
  gem.description   = %q{Fluentd is an open source data collector designed to scale and simplify log management. It can collect, process and ship many kinds of data in near real-time.}
  gem.summary       = %q{Fluentd event collector}
  gem.homepage      = "https://www.fluentd.org/"

  gem.files         = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[tasks/ test/ .git Gemfile])
    end
  end
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]
  gem.license = "Apache-2.0"

  gem.metadata["homepage_uri"] = gem.homepage
  gem.metadata["source_code_uri"] = "https://github.com/fluent/fluentd"
  gem.metadata["changelog_uri"] = "https://github.com/fluent/fluentd/blob/master/CHANGELOG.md"
  gem.metadata["bug_tracker_uri"] = "https://github.com/fluent/fluentd/issues"

  gem.required_ruby_version = '>= 3.2'

  gem.add_runtime_dependency("bundler")
  gem.add_runtime_dependency("msgpack", [">= 1.3.1", "< 2.0.0"])
  gem.add_runtime_dependency("yajl-ruby", ["~> 1.0"])
  gem.add_runtime_dependency("cool.io", [">= 1.4.5", "< 2.0.0"])
  gem.add_runtime_dependency("serverengine", [">= 2.3.2", "< 3.0.0"])
  gem.add_runtime_dependency("http_parser.rb", [">= 0.5.1", "< 0.9.0"])
  gem.add_runtime_dependency("sigdump", ["~> 0.2.5"])
  gem.add_runtime_dependency("tzinfo", [">= 1.0", "< 3.0"])
  gem.add_runtime_dependency("tzinfo-data", ["~> 1.0"])
  gem.add_runtime_dependency("strptime", [">= 0.2.4", "< 1.0.0"])
  gem.add_runtime_dependency("webrick", ["~> 1.4"])
  gem.add_runtime_dependency("zstd-ruby", ["~> 1.5"])
  gem.add_runtime_dependency("uri", '~> 1.0')
  gem.add_runtime_dependency("async-http", "~> 0.86")

  # It appears io-event >= 1.11.0 are unstable on Windows (confirmed on 1.12.1 or lower).
  # See https://github.com/fluent/fluentd/issues/5041.
  gem.add_runtime_dependency("io-event", "< 1.11.0")
  # io-stream >= 0.8 needs io-event >= 1.12.0, so we need to fix io-stream version as well (confirmed on 0.10.0 or lower).
  # See https://github.com/socketry/io-stream/issues/8.
  gem.add_runtime_dependency("io-stream", "< 0.8.0")

  # gems that aren't default gems as of Ruby 3.4
  gem.add_runtime_dependency("base64", ["~> 0.2"])
  gem.add_runtime_dependency("csv", ["~> 3.2"])
  gem.add_runtime_dependency("drb", ["~> 2.2"])

  # gems that aren't default gems as of Ruby 3.5
  gem.add_runtime_dependency("logger", ["~> 1.6"])

  # build gem for a certain platform. see also Rakefile
  fake_platform = ENV['GEM_BUILD_FAKE_PLATFORM'].to_s
  gem.platform = fake_platform unless fake_platform.empty?
  if /mswin|mingw/ =~ fake_platform || (/mswin|mingw/ =~ RUBY_PLATFORM && fake_platform.empty?)
    gem.add_runtime_dependency("win32-service", ["~> 2.3.0"])
    gem.add_runtime_dependency("win32-ipc", ["~> 0.7.0"])
    gem.add_runtime_dependency("win32-event", ["~> 0.6.3"])
    gem.add_runtime_dependency("certstore_c", ["~> 0.1.7"])

    # gems that aren't default gems as of Ruby 3.5
    gem.add_runtime_dependency("fiddle", ["~> 1.1"])
  end

  gem.add_development_dependency("rake", ["~> 13.0"])
  gem.add_development_dependency("flexmock", ["~> 2.0"])
  gem.add_development_dependency("parallel_tests", ["~> 0.15.3"])
  gem.add_development_dependency("simplecov", ["~> 0.7"])
  gem.add_development_dependency("rr", ["~> 3.0"])
  # timecop v0.9.9 supports `Process.clock_gettime`. It breaks some tests.
  # (https://github.com/fluent/fluentd/pull/4521)
  gem.add_development_dependency("timecop", ["< 0.9.9"])
  gem.add_development_dependency("test-unit", ["~> 3.3"])
  gem.add_development_dependency("test-unit-rr", ["~> 1.0"])
  gem.add_development_dependency("oj", [">= 2.14", "< 4"])
  gem.add_development_dependency("console", "~> 1.30")
  gem.add_development_dependency("aws-sigv4", ["~> 1.8"])
  gem.add_development_dependency("aws-sdk-core", ["~> 3.191"])
  gem.add_development_dependency("rexml", ["~> 3.2"])
end
