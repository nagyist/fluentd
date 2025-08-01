# v1.19

## Release v1.19.0 - 2025/07/30

### Enhancement

New features:

* Add zstd compression support https://github.com/fluent/fluentd/pull/4657
  * Buffer: add `zstd` to `compress` option.
  * out_file: add `zstd` to `compress` option.
  * out_forward: add `zstd` to `compress` option.
  * in_forward: support `zstd` format. (Experimental)
* buffer: add feature to evacuate chunk files when retry limit
  https://github.com/fluent/fluentd/pull/4986
* out_http: TLS1.3 support
  https://github.com/fluent/fluentd/pull/4859
* out_stdout: support output to STDOUT independently of Fluentd logger by setting `use_logger` to `false`
  https://github.com/fluent/fluentd/pull/5036
* out_file: add symlink_path_use_relative option to use relative path instead of absolute path in symlink_path
  https://github.com/fluent/fluentd/pull/4904
* System configuration: Add forced_stacktrace_level to force the log level of stacktraces.
  https://github.com/fluent/fluentd/pull/5008
* System configuration: support built-in config files
  https://github.com/fluent/fluentd/pull/4893

Metrics:

* metrics: enable input metrics by default
  https://github.com/fluent/fluentd/pull/4966
* in_tail: add "tracked_file_count" metrics to see how many log files are being tracked
  https://github.com/fluent/fluentd/pull/4980
* output: add metrics for number of writing events in secondary
  https://github.com/fluent/fluentd/pull/4971
* output: add metrics for dropped oldest chunk count
  https://github.com/fluent/fluentd/pull/4981

Others:

* in_forward: enable skip_invalid_event by default not to process broken data
  https://github.com/fluent/fluentd/pull/5003
* buf_file: reinforce buffer file corruption check
  https://github.com/fluent/fluentd/pull/4998
* in_http: allow empty Origin header requests to pass CORS checks
  https://github.com/fluent/fluentd/pull/4866
* in_tail: add warning for directory permission
  https://github.com/fluent/fluentd/pull/4865
* Add logging for errors about loading dependencies on startup
  https://github.com/fluent/fluentd/pull/4858
* Performance improvements
  * https://github.com/fluent/fluentd/pull/4759
    https://github.com/fluent/fluentd/pull/4760
    https://github.com/fluent/fluentd/pull/4763
    https://github.com/fluent/fluentd/pull/4764
    https://github.com/fluent/fluentd/pull/4769
    https://github.com/fluent/fluentd/pull/4813
    https://github.com/fluent/fluentd/pull/4817
    https://github.com/fluent/fluentd/pull/4835
    https://github.com/fluent/fluentd/pull/4845
    https://github.com/fluent/fluentd/pull/4881
    https://github.com/fluent/fluentd/pull/4884
    https://github.com/fluent/fluentd/pull/4886
    https://github.com/fluent/fluentd/pull/4930
    https://github.com/fluent/fluentd/pull/4931
    https://github.com/fluent/fluentd/pull/4932
    https://github.com/fluent/fluentd/pull/4933
    https://github.com/fluent/fluentd/pull/4934
    https://github.com/fluent/fluentd/pull/4995

### Bug Fix

* in_tail: fixed where specifying only encoding parameter might cause data corruption (affects since v0.14.12).
  https://github.com/fluent/fluentd/pull/5010
* formatter_csv: fix memory leak
  https://github.com/fluent/fluentd/pull/4864
* server plugin helper: ensure to close all connections at shutdown
  https://github.com/fluent/fluentd/pull/5026
* Fixed a bug where the default `umask` was not set to `0` when using `--daemon` (td-agent, fluent-package) since v1.14.6.
  https://github.com/fluent/fluentd/pull/4836
* `--umask` command line option: Fixed so that it is applied when Fluentd runs with `--daemon` (fluent-package) as well as when Fluentd runs with `--no-supervisor`.
  https://github.com/fluent/fluentd/pull/4836
* Windows: Stop the service when the supervisor is dead
  https://github.com/fluent/fluentd/pull/4909
* Windows: Fixed an issue where stopping the service immediately after startup could leave the processes.
  https://github.com/fluent/fluentd/pull/4782
* Windows: Fixed an issue where stopping service sometimes can not be completed forever.
  https://github.com/fluent/fluentd/pull/4782

### Misc

* in_monitor_agent: stop using CGI.parse due to support Ruby 3.5
  https://github.com/fluent/fluentd/pull/4962
* HTTP server plugin helper: stop using CGI.parse due to support Ruby 3.5
  https://github.com/fluent/fluentd/pull/4962
* config: change inspect format
  https://github.com/fluent/fluentd/pull/4914
* console_adapter: support console gem v1.30
  https://github.com/fluent/fluentd/pull/4857
* gemspec: fix io-event and io-stream version to avoid unstable behavior on Windows
  https://github.com/fluent/fluentd/pull/5042
* in_http: replace WEBrick::HTTPUtils.parse_query with URI
  Note that at least, this makes it unable to use ; delimiter.
  https://github.com/fluent/fluentd/pull/4900
* http_server: stop fallback to WEBrick
  https://github.com/fluent/fluentd/pull/4899
* metrics: add getter method automatically
  https://github.com/fluent/fluentd/pull/4978
* http_server helper: add `header` method for `Request`
  https://github.com/fluent/fluentd/pull/4903
* multi_output: fix metrics name
  https://github.com/fluent/fluentd/pull/4979
* plugin_id: fix typo
  https://github.com/fluent/fluentd/pull/4964
* CI fixes
  * https://github.com/fluent/fluentd/pull/4728
    https://github.com/fluent/fluentd/pull/4730
    https://github.com/fluent/fluentd/pull/4746
    https://github.com/fluent/fluentd/pull/4747
    https://github.com/fluent/fluentd/pull/4748
    https://github.com/fluent/fluentd/pull/4750
    https://github.com/fluent/fluentd/pull/4755
    https://github.com/fluent/fluentd/pull/4820
    https://github.com/fluent/fluentd/pull/4874
    https://github.com/fluent/fluentd/pull/4877
* Fixes RuboCop's remarks
  https://github.com/fluent/fluentd/pull/4928
* CI: Add benchmark scripts
  https://github.com/fluent/fluentd/pull/4989

# v1.18

## Release v1.18.0 - 2024/11/29

### Enhancement

* Add zero-downtime-restart feature for non-Windows
  https://github.com/fluent/fluentd/pull/4624
* Add with-source-only feature
  https://github.com/fluent/fluentd/pull/4661
  * `fluentd` command: Add `--with-source-only` option
  * System configuration: Add `with_source_only` option
* Embedded plugin: Add `out_buffer` plugin, which can be used for buffering and relabeling events
  https://github.com/fluent/fluentd/pull/4661
* Config File Syntax: Extend Embedded Ruby Code support for Hashes and Arrays
  https://github.com/fluent/fluentd/pull/4580
  * Example: `key {"foo":"#{1 + 1}"} => key {"foo":"2"}`
  * Please note that this is not backward compatible, although we assume that this will never affect to actual existing configs.
  * In case the behavior changes unintentionally, you can disable this feature by surrounding the entire value with single quotes.
    * `key '{"foo":"#{1 + 1}"}' => key {"foo":"#{1 + 1}"}`
* transport tls: Use SSL_VERIFY_NONE by default
  https://github.com/fluent/fluentd/pull/4718
* transport tls: Add ensure_fips option to ensure FIPS compliant mode
  https://github.com/fluent/fluentd/pull/4720
* plugin_helper/server: Add receive_buffer_size parameter in transport section
  https://github.com/fluent/fluentd/pull/4649
* filter_parser: Now able to handle multiple parsed results
  https://github.com/fluent/fluentd/pull/4620
* in_http: add `add_tag_prefix` option
  https://github.com/fluent/fluentd/pull/4655
* System configuration: add `path` option in `log` section
  https://github.com/fluent/fluentd/pull/4604

### Bug Fix

* command: fix NoMethodError of --daemon under Windows
  https://github.com/fluent/fluentd/pull/4716
* `fluentd` command: fix `--plugin` (`-p`) option not to overwrite default value
  https://github.com/fluent/fluentd/pull/4605

### Misc

* http_server: Ready to support Async 2.0 gem
  https://github.com/fluent/fluentd/pull/4619
* Minor code refactoring
  * https://github.com/fluent/fluentd/pull/4641
* CI fixes
  * https://github.com/fluent/fluentd/pull/4638
  * https://github.com/fluent/fluentd/pull/4644
  * https://github.com/fluent/fluentd/pull/4675
  * https://github.com/fluent/fluentd/pull/4676
  * https://github.com/fluent/fluentd/pull/4677
  * https://github.com/fluent/fluentd/pull/4686

# v1.17

## Release v1.17.1 - 2024/08/19

### Enhancement

* out_http: Add `compress gzip` option
  https://github.com/fluent/fluentd/pull/4528
* in_exec: Add `encoding` option to handle non-ascii characters
  https://github.com/fluent/fluentd/pull/4533
* in_tail: Add throttling metrics
  https://github.com/fluent/fluentd/pull/4578
* compat: Improve method call performance
  https://github.com/fluent/fluentd/pull/4588
* in_sample: Add `reuse_record` parameter to reuse the sample data
  https://github.com/fluent/fluentd/pull/4586
  * `in_sample` has changed to copy sample data by default to avoid the impact of destructive changes by subsequent plugins.
  * This increases the load when generating large amounts of sample data.
  * You can use this new parameter to have the same performance as before.

### Bug Fix

* logger: Fix LoadError with console gem v1.25
  https://github.com/fluent/fluentd/pull/4492
* parser_json: Fix wrong LoadError warning
  https://github.com/fluent/fluentd/pull/4522
* in_tail: Fix an issue where a large single line could consume a large amount of memory even though `max_line_size` is set
  https://github.com/fluent/fluentd/pull/4530
* yaml_parser: Support $log_level element
  https://github.com/fluent/fluentd/pull/4482

### Misc

* Comment out inappropriate default configuration about out_forward
  https://github.com/fluent/fluentd/pull/4523
* gemspec: Remove unnecessary files from released gem
  https://github.com/fluent/fluentd/pull/4534
* plugin-generator: Update gemspec to remove unnecessary files
  https://github.com/fluent/fluentd/pull/4535
* Suppress non-parenthesis warnings
  https://github.com/fluent/fluentd/pull/4594
* Fix FrozenError in http_server plugin helper
  https://github.com/fluent/fluentd/pull/4598
* Add logger gem dependency for Ruby 3.5
  https://github.com/fluent/fluentd/pull/4589
* out_file: Add warn message for symlink_path setting
  https://github.com/fluent/fluentd/pull/4502

## Release v1.17.0 - 2024/04/30

### Enhancement

* in_http: Recognize CSP reports as JSON data
  https://github.com/fluent/fluentd/pull/4282
* out_http: Add option to reuse connections
  https://github.com/fluent/fluentd/pull/4330
* in_tail: Expand glob capability for square brackets and one character matcher
  https://github.com/fluent/fluentd/pull/4401
* out_http: Support AWS Signature Version 4 authentication
  https://github.com/fluent/fluentd/pull/4459

### Bug Fix

* Make sure `parser_json` and `parser_msgpack` return `Hash`.
  Make `parser_json` and `parser_msgpack` accept only `Hash` or `Array` of `Hash`.
  https://github.com/fluent/fluentd/pull/4474
* filter_parser: Add error event for multiple parsed results
  https://github.com/fluent/fluentd/pull/4478

### Misc

* Raise minimum required ruby version
  https://github.com/fluent/fluentd/pull/4288
* Require missing dependent gems as of Ruby 3.4-dev
  https://github.com/fluent/fluentd/pull/4411
* Minor code refactoring
  https://github.com/fluent/fluentd/pull/4294
  https://github.com/fluent/fluentd/pull/4299
  https://github.com/fluent/fluentd/pull/4302
  https://github.com/fluent/fluentd/pull/4320
* CI fixes
  https://github.com/fluent/fluentd/pull/4369
  https://github.com/fluent/fluentd/pull/4433
  https://github.com/fluent/fluentd/pull/4452
  https://github.com/fluent/fluentd/pull/4477
* github: unify YAML file extension to .yml
  https://github.com/fluent/fluentd/pull/4429

# v1.16

## Release v1.16.9 - 2025/05/14

### Bug Fix

* winsvc: Fix bug where service accidentally stops after starting.
  The previous version (v1.16.8) should not be used for Windows Service.
  https://github.com/fluent/fluentd/pull/4955

### Misc

* CI improvements
  https://github.com/fluent/fluentd/pull/4956

## Release v1.16.8 - 2025/05/01

**This version has a critical bug about Windows Service. Do not use this version.**
(https://github.com/fluent/fluentd/pull/4955)

### Bug Fix

* winsvc: Stop the service when the supervisor is dead
  https://github.com/fluent/fluentd/pull/4942
* formatter_csv: Fix memory leak
  https://github.com/fluent/fluentd/pull/4920

### Misc

* Add fiddle as dependency gem for Ruby 3.5 on Windows
  https://github.com/fluent/fluentd/pull/4919
* Refactoring code
  https://github.com/fluent/fluentd/pull/4921
  https://github.com/fluent/fluentd/pull/4922
  https://github.com/fluent/fluentd/pull/4926
  https://github.com/fluent/fluentd/pull/4943
* CI improvements
  https://github.com/fluent/fluentd/pull/4821
  https://github.com/fluent/fluentd/pull/4850
  https://github.com/fluent/fluentd/pull/4851
  https://github.com/fluent/fluentd/pull/4862
  https://github.com/fluent/fluentd/pull/4915
  https://github.com/fluent/fluentd/pull/4923
  https://github.com/fluent/fluentd/pull/4925
  https://github.com/fluent/fluentd/pull/4927

## Release v1.16.7 - 2025/01/29

### Bug Fix

* Windows: Fix `NoMethodError` of `--daemon` option
  https://github.com/fluent/fluentd/pull/4796
* Windows: Fixed an issue where stopping the service immediately after startup could leave the processes
  https://github.com/fluent/fluentd/pull/4782
* Windows: Fixed an issue where stopping service sometimes can not be completed forever
  https://github.com/fluent/fluentd/pull/4782

### Misc

* Windows: Add workaround for unexpected exception
  https://github.com/fluent/fluentd/pull/4747
* README: remove deprecated google analytics beacon
  https://github.com/fluent/fluentd/pull/4797
* CI improvements
  https://github.com/fluent/fluentd/pull/4723
  https://github.com/fluent/fluentd/pull/4788
  https://github.com/fluent/fluentd/pull/4789
  https://github.com/fluent/fluentd/pull/4790
  https://github.com/fluent/fluentd/pull/4791
  https://github.com/fluent/fluentd/pull/4793
  https://github.com/fluent/fluentd/pull/4794
  https://github.com/fluent/fluentd/pull/4795
  https://github.com/fluent/fluentd/pull/4798
  https://github.com/fluent/fluentd/pull/4799
  https://github.com/fluent/fluentd/pull/4800
  https://github.com/fluent/fluentd/pull/4801
  https://github.com/fluent/fluentd/pull/4803

## Release v1.16.6 - 2024/08/16

### Bug Fix

* YAML config syntax: Fix issue where `$log_level` element was not supported correctly
  https://github.com/fluent/fluentd/pull/4486
* parser_json: Fix wrong LoadError warning
  https://github.com/fluent/fluentd/pull/4592
* `fluentd` command: Fix `--plugin` (`-p`) option not to overwrite default value
  https://github.com/fluent/fluentd/pull/4605

### Misc

* out_file: Add warn message for symlink_path setting
  https://github.com/fluent/fluentd/pull/4512
* Keep console gem v1.23 to avoid LoadError
  https://github.com/fluent/fluentd/pull/4510

## Release v1.16.5 - 2024/03/27

### Bug Fix

* Buffer: Fix emit error of v1.16.4 sometimes failing to process large data
  exceeding chunk size limit
  https://github.com/fluent/fluentd/pull/4447

## Release v1.16.4 - 2024/03/14

### Bug Fix

* Fix to avoid processing discarded chunks in write_step_by_step.
  It fixes not to raise pile of IOError when many `chunk
  bytes limit exceeds` errors are occurred.
  https://github.com/fluent/fluentd/pull/4342
* in_tail: Fix tail watchers in `rotate_wait` state not being managed.
  https://github.com/fluent/fluentd/pull/4334

### Misc

* buffer: Avoid unnecessary log processing. It will improve performance.
  https://github.com/fluent/fluentd/pull/4331

## Release v1.16.3 - 2023/11/14

### Bug Fix

* in_tail: Fix a stall bug on !follow_inode case
  https://github.com/fluent/fluentd/pull/4327
* in_tail: add warning for silent stop on !follow_inodes case
  https://github.com/fluent/fluentd/pull/4339
* Buffer: Fix NoMethodError with empty unstaged chunk arrays
  https://github.com/fluent/fluentd/pull/4303
* Fix for rotate_age where Fluentd passes as Symbol
  https://github.com/fluent/fluentd/pull/4311

## Release v1.16.2 - 2023/07/14

### Bug Fix

* in_tail: Fix new watcher is wrongly detached on rotation when `follow_inodes`,
  which causes stopping tailing the file
  https://github.com/fluent/fluentd/pull/4208
* in_tail: Prevent wrongly unwatching when `follow_inodes`, which causes log
  duplication
  https://github.com/fluent/fluentd/pull/4237
* in_tail: Fix warning log about overwriting entry when `follow_inodes`
  https://github.com/fluent/fluentd/pull/4214
* in_tail: Ensure to discard TailWatcher with missing target when `follow_inodes`
  https://github.com/fluent/fluentd/pull/4239
* MessagePackFactory: Make sure to reset local unpacker to prevent received
  broken data from affecting other receiving data
  https://github.com/fluent/fluentd/pull/4178
* Fix failure to launch Fluentd on Windows when the log path isn't specified in
  the command line
  https://github.com/fluent/fluentd/pull/4188
* logger: Prevent growing cache size of `ignore_same_log_interval` unlimitedly
  https://github.com/fluent/fluentd/pull/4229
* Update sigdump to 0.2.5 to fix wrong value of object counts
  https://github.com/fluent/fluentd/pull/4225

### Misc

* in_tail: Check detaching inode when `follow_inodes`
  https://github.com/fluent/fluentd/pull/4191
* in_tail: Add debug log for pos file compaction
  https://github.com/fluent/fluentd/pull/4228
* Code improvements detected by RuboCop Performance
  https://github.com/fluent/fluentd/pull/4201
  https://github.com/fluent/fluentd/pull/4210
* Add notice for unused argument `unpacker` of `ChunkMessagePackEventStreamer.each`
  https://github.com/fluent/fluentd/pull/4159

## Release v1.16.1 - 2023/04/17

### Enhancement

* in_tcp: Add `message_length_limit` to drop large incoming data
  https://github.com/fluent/fluentd/pull/4137

### Bug Fix

* Fix NameError of `SecondaryFileOutput` when setting secondary other than
  `out_secondary_file`
  https://github.com/fluent/fluentd/pull/4124
* Server helper: Suppress error of `UDPServer` over `max_bytes` on Windows
  https://github.com/fluent/fluentd/pull/4131
* Buffer: Fix that `compress` setting causes unexpected error when receiving
  already compressed MessagePack
  https://github.com/fluent/fluentd/pull/4147

### Misc

* Update MAINTAINERS.md
  https://github.com/fluent/fluentd/pull/4119
* Update security policy
  https://github.com/fluent/fluentd/pull/4123
* Plugin template: Remove unnecessary code
  https://github.com/fluent/fluentd/pull/4128
* Revive issue auto closer
  https://github.com/fluent/fluentd/pull/4116
* Fix a link for the repository of td-agent
  https://github.com/fluent/fluentd/pull/4145
* in_udp: add test of message_length_limit
  https://github.com/fluent/fluentd/pull/4117
* Fix a typo of an argument of `Fluent::EventStream#each`
  https://github.com/fluent/fluentd/pull/4148
* Test in_tcp: Fix undesirable way to assert logs
  https://github.com/fluent/fluentd/pull/4138

## Release v1.16.0 - 2023/03/29

### Enhancement

* in_tcp: Add `send_keepalive_packet` option
  https://github.com/fluent/fluentd/pull/3961
* buffer: backup broken file chunk
  https://github.com/fluent/fluentd/pull/4025
* Add warning messages for restoring buffer with `flush_at_shutdown true`
  https://github.com/fluent/fluentd/pull/4027
* Add logs for time period of restored buffer possibly broken
  https://github.com/fluent/fluentd/pull/4028

### Bug Fix

* http_server_helper: Fix format of log messages originating from Async gem
  https://github.com/fluent/fluentd/pull/3987
* Change to not generate a sigdump file after receiving a `SIGTERM` signal on
  non-Windows
  https://github.com/fluent/fluentd/pull/4034
  https://github.com/fluent/fluentd/pull/4043
* out_forward: fix error of ack handling conflict on stopping with
  `require_ack_response` enabled
  https://github.com/fluent/fluentd/pull/4030
* Fix problem that some `system` configs are not reflected
  https://github.com/fluent/fluentd/pull/4064
  https://github.com/fluent/fluentd/pull/4065
  https://github.com/fluent/fluentd/pull/4086
  https://github.com/fluent/fluentd/pull/4090
  https://github.com/fluent/fluentd/pull/4096
* Fix bug that the logger outputs some initial log messages without applying
  some settings such as `format`
  https://github.com/fluent/fluentd/pull/4091
* Windows: Fix a bug that the wrong log file is reopened with log rotate setting
  when flushing or graceful reloading
  https://github.com/fluent/fluentd/pull/4054
* Fix race condition of out_secondary_file
  https://github.com/fluent/fluentd/pull/4081
* Suppress warning using different secondary for out_secondary_file
  https://github.com/fluent/fluentd/pull/4087
* Fix value of `system_config.workers` at `run_configure`.
  Change argument type of `Fluent::Plugin::Base::configure()` to
  `Fluent::Config::Element` only.
  https://github.com/fluent/fluentd/pull/4066
* Fix bug that Fluentd sometimes tries to use an unavailable port and fails to
  start on Windows
  https://github.com/fluent/fluentd/pull/4092

### Misc

* Add method for testing `filtered_with_time`
  https://github.com/fluent/fluentd/pull/3899
* Replace `$$` with `Process.pid`
  https://github.com/fluent/fluentd/pull/4040
* Relax required webric gem version
  https://github.com/fluent/fluentd/pull/4061
* CI fixes to support Ruby 3.2
  https://github.com/fluent/fluentd/pull/3968
  https://github.com/fluent/fluentd/pull/3996
  https://github.com/fluent/fluentd/pull/3997
* Other CI fixes
  https://github.com/fluent/fluentd/pull/3969
  https://github.com/fluent/fluentd/pull/3990
  https://github.com/fluent/fluentd/pull/4013
  https://github.com/fluent/fluentd/pull/4033
  https://github.com/fluent/fluentd/pull/4044
  https://github.com/fluent/fluentd/pull/4050
  https://github.com/fluent/fluentd/pull/4062
  https://github.com/fluent/fluentd/pull/4074
  https://github.com/fluent/fluentd/pull/4082
  https://github.com/fluent/fluentd/pull/4085
* Update MAINTAINERS.md
  https://github.com/fluent/fluentd/pull/4026
  https://github.com/fluent/fluentd/pull/4069

# v1.15

## Release v1.15.3 - 2022/11/02

### Bug Fix

* Support glob for `!include` directive in YAML config format
  https://github.com/fluent/fluentd/pull/3917
* Remove meaningless oj options
  https://github.com/fluent/fluentd/pull/3929
* Fix log initializer to correctly create per-process files on Windows
  https://github.com/fluent/fluentd/pull/3939
* out_file: Fix the multi-worker check with `<worker 0-N>` directive
  https://github.com/fluent/fluentd/pull/3942

### Misc

* Fix broken tests on Ruby 3.2
  https://github.com/fluent/fluentd/pull/3883
  https://github.com/fluent/fluentd/pull/3922

## Release v1.15.2 - 2022/08/22

### Enhancement

* Add a new system configuration `enable_jit`
  https://github.com/fluent/fluentd/pull/3857

### Bug Fix

* out_file: Fix append mode with `--daemon` flag
  https://github.com/fluent/fluentd/pull/3864
* child_process: Plug file descriptor leak
  https://github.com/fluent/fluentd/pull/3844

### Misc

* Drop win32-api gem to support Ruby 3.2
  https://github.com/fluent/fluentd/pull/3849
  https://github.com/fluent/fluentd/pull/3866

## Release v1.15.1 - 2022/07/27

### Bug Fix

* Add support for concurrent append in out_file
  https://github.com/fluent/fluentd/pull/3808

### Misc

* in_tail: Show more information on skipping update_watcher
  https://github.com/fluent/fluentd/pull/3829

## Release v1.15.0 - 2022/06/29

### Enhancement

* in_tail: Add log throttling in files based on group rules
  https://github.com/fluent/fluentd/pull/3535
  https://github.com/fluent/fluentd/pull/3771
* Add `dump` command to fluent-ctl
  https://github.com/fluent/fluentd/pull/3680
* Handle YAML configuration format on configuration file
  https://github.com/fluent/fluentd/pull/3712
* Add `restart_worker_interval` parameter in `<system>` directive to set
  interval to restart workers that has stopped for some reason.
  https://github.com/fluent/fluentd/pull/3768

### Bug fixes

* out_forward: Fix to update timeout of cached sockets
  https://github.com/fluent/fluentd/pull/3711
* in_tail: Fix a possible crash on file rotation when `follow_inodes true`
  https://github.com/fluent/fluentd/pull/3754
* output: Fix a possible crash of flush thread
  https://github.com/fluent/fluentd/pull/3755
* in_tail: Fix crash bugs on Ruby 3.1 on Windows
  https://github.com/fluent/fluentd/pull/3766
* in_tail: Fix a bug that in_tail cannot open non-ascii path on Windows
  https://github.com/fluent/fluentd/pull/3774
* Fix a bug that fluentd doesn't release its own log file even after rotated by
  external tools
  https://github.com/fluent/fluentd/pull/3782

### Misc

* in_tail: Simplify TargetInfo related code
  https://github.com/fluent/fluentd/pull/3489
* Fix a wrong issue number in CHANGELOG
  https://github.com/fluent/fluentd/pull/3700
* server helper: Add comments to linger_timeout behavior about Windows
  https://github.com/fluent/fluentd/pull/3701
* service_discovery: Fix typo
  https://github.com/fluent/fluentd/pull/3724
* test: Fix unstable tests and warnings
  https://github.com/fluent/fluentd/pull/3745
  https://github.com/fluent/fluentd/pull/3753
  https://github.com/fluent/fluentd/pull/3767
  https://github.com/fluent/fluentd/pull/3783
  https://github.com/fluent/fluentd/pull/3784
  https://github.com/fluent/fluentd/pull/3785
  https://github.com/fluent/fluentd/pull/3787

# v1.14

## Release v1.14.6 - 2022/03/31

### Enhancement

* Enable server plugins to specify socket-option `SO_LINGER`
  https://github.com/fluent/fluentd/pull/3644
* Add `--umask` command line parameter
  https://github.com/fluent/fluentd/pull/3671
  https://github.com/fluent/fluentd/pull/3679

### Bug fixes

* Fix metric name typo
  https://github.com/fluent/fluentd/pull/3630
  https://github.com/fluent/fluentd/pull/3673
* Apply modifications in pipeline to the records being passed to `@ERROR` label
  https://github.com/fluent/fluentd/pull/3631
* Fix wrong calculation of retry interval
  https://github.com/fluent/fluentd/pull/3640
  https://github.com/fluent/fluentd/pull/3649
  https://github.com/fluent/fluentd/pull/3685
  https://github.com/fluent/fluentd/pull/3686
* Support IPv6 address for `rpc_endpoint` in `system` config
  https://github.com/fluent/fluentd/pull/3641

### Misc

* CI: Support Ruby 3.1 except Windows
  https://github.com/fluent/fluentd/pull/3619
* Switch to GitHub Discussions
  https://github.com/fluent/fluentd/pull/3654
* Fix CHANGELOG.md heading styles
  https://github.com/fluent/fluentd/pull/3648
* Declare `null_value_pattern` as `regexp`
  https://github.com/fluent/fluentd/pull/3650

## Release v1.14.5 - 2022/02/09

### Enhancement

* Add support for "application/x-ndjson" to `in_http`
  https://github.com/fluent/fluentd/pull/3616
* Add support for ucrt binary for Windows
  https://github.com/fluent/fluentd/pull/3613

### Bug fixes

* Don't retry when `retry_max_times == 0`
  https://github.com/fluent/fluentd/pull/3608
* Fix hang-up issue during TLS handshake in `out_forward`
  https://github.com/fluent/fluentd/pull/3601
* Bump up required ServerEngine to v2.2.5
  https://github.com/fluent/fluentd/pull/3599
* Fix "invalid byte sequence is replaced" warning on Kubernetes
  https://github.com/fluent/fluentd/pull/3596
* Fix "ArgumentError: unknown keyword: :logger" on Windows with Ruby 3.1
  https://github.com/fluent/fluentd/pull/3592

## Release v1.14.4 - 2022/01/06

### Enhancement

* `in_tail`: Add option to skip long lines (`max_line_size`)
  https://github.com/fluent/fluentd/pull/3565

### Bug fix

* Incorrect BufferChunkOverflowError when each event size is < `chunk_limit_size`
  https://github.com/fluent/fluentd/pull/3560
* On macOS with Ruby 2.7/3.0, `out_file` fails to write events if `append` is true.
  https://github.com/fluent/fluentd/pull/3579
* test: Fix unstable test cases
  https://github.com/fluent/fluentd/pull/3574
  https://github.com/fluent/fluentd/pull/3577

## Release v1.14.3 - 2021/11/26

### Enhancement

* Changed to accept `http_parser.rb` 0.8.0.
  `http_parser.rb` 0.8.0 is ready for Ractor.
  https://github.com/fluent/fluentd/pull/3544

### Bug fix

* in_tail: Fixed a bug that no new logs are read when
  `enable_stat_watcher true` and `enable_watch_timer false` is set.
  https://github.com/fluent/fluentd/pull/3541
* in_tail: Fixed a bug that the beginning and initial lines are lost
  after startup when `read_from_head false` and path includes wildcard '*'.
  https://github.com/fluent/fluentd/pull/3542
* Fixed a bug that processing messages were lost when
  BufferChunkOverflowError was thrown even though only a specific
  message size exceeds chunk_limit_size.
  https://github.com/fluent/fluentd/pull/3553
  https://github.com/fluent/fluentd/pull/3562

### Misc

* Bump up required version of `win32-service` gem.
  newer version is required to implement additional `fluent-ctl` commands.
  https://github.com/fluent/fluentd/pull/3556

## Release v1.14.2 - 2021/10/29

IMPORTANT: This release contain the fix for CVE-2021-41186 -
ReDoS vulnerability in `parser_apache2`.
This vulnerability is affected from Fluentd v0.14.14 to v1.14.1.
We recommend to upgrade Fluentd to v1.14.2 or use patched version of
`parser_apache2` plugin.

### Enhancement

* fluent-cat: Add `--event-time` option to send specified event time for testing.
  https://github.com/fluent/fluentd/pull/3528

### Bug fix

* Fixed to generate correct epoch timestamp even after switching Daylight Saving Time
  https://github.com/fluent/fluentd/pull/3524
* Fixed ReDoS vulnerability in parser_apache2.
  This vulnerability is caused by a certain pattern of a broken apache log.

## Release v1.14.1 - 2021/09/29

### Enhancement

* in_tail: Added file related metrics.
  These metrics should be collected same as fluent-bit's in_tail.
  https://github.com/fluent/fluentd/pull/3504
* out_forward: Changed to use metrics mechanism for node statistics
  https://github.com/fluent/fluentd/pull/3506

### Bug fix

* in_tail: Fixed a crash bug that it raise undefined method of eof? error.
  This error may happen only when `read_bytes_limit_per_second` was specified.
  https://github.com/fluent/fluentd/pull/3500
* out_forward: Fixed a bug that node statistics information is not included correctly.
  https://github.com/fluent/fluentd/pull/3503
  https://github.com/fluent/fluentd/pull/3507
* Fixed a error when using `@include` directive
  It was occurred when http/https scheme URI is used in `@include` directive with Ruby 3.
  https://github.com/fluent/fluentd/pull/3517
* out_copy: Fixed to suppress a wrong warning for `ignore_if_prev_success`
  It didn't work even if a user set it.
  https://github.com/fluent/fluentd/pull/3515
* Fixed not to output nanoseconds field of next retry time in warning log
  Then, inappropriate labels in log are also fixed. (retry_time -> retry_times,
  next_retry_seconds -> next_retry_time)
  https://github.com/fluent/fluentd/pull/3518

## Release v1.14.0 - 2021/08/30

### Enhancement

* Added `enable_input_metrics`, `enable_size_metrics` system
  configuration parameter
  This feature might need to pay higher CPU cost, so input event metrics
  features are disabled by default. These features are also enabled by
  `--enable-input-metrics`,`--enable-size-metrics` command line
  option.
  https://github.com/fluent/fluentd/pull/3440
* Added reserved word `@ROOT` for getting root router.
  This is incompatible change. Do not use `@ROOT` for label name.
  https://github.com/fluent/fluentd/pull/3358
* in_syslog: Added `send_keepalive_packet` option
  https://github.com/fluent/fluentd/pull/3474
* in_http: Added `cors_allow_credentials` option.
  This option tells browsers whether to expose the response to
  frontend when the credentials mode is "include".
  https://github.com/fluent/fluentd/pull/3481
  https://github.com/fluent/fluentd/pull/3491

### Bug fix

* in_tail: Fixed a bug that deleted paths are not removed
  from pos file by file compaction at start up
  https://github.com/fluent/fluentd/pull/3467
* in_tail: Revived a warning message of retrying unaccessible file
  https://github.com/fluent/fluentd/pull/3478
* TLSServer: Fixed a crash bug on logging peer host name errors
  https://github.com/fluent/fluentd/pull/3483

### Misc

* Added metrics plugin mechanism
  The implementations is changed to use metrics plugin.
  In the future, 3rd party plugin will be able to handle these metrics.
  https://github.com/fluent/fluentd/pull/3471
  https://github.com/fluent/fluentd/pull/3473
  https://github.com/fluent/fluentd/pull/3479
  https://github.com/fluent/fluentd/pull/3484

# v1.13

## Release v1.13.3 - 2021/07/27

### Bug fix

* in_tail: Care DeletePending state on Windows
  https://github.com/fluent/fluentd/pull/3457
  https://github.com/fluent/fluentd/pull/3460
* in_tail: Fix some pos_file bugs.
  Avoid deleting pos_file entries unexpectedly when both
  `pos_file_compaction_interval` and `follow_inode` are enabled.
  Use `bytesize` instead of `size` for path length.
  https://github.com/fluent/fluentd/pull/3459
* in_tail: Fix detecting rotation twice on `follow_inode`.
  https://github.com/fluent/fluentd/pull/3466

### Misc

* Remove needless spaces in a sample config file
  https://github.com/fluent/fluentd/pull/3456

## Release v1.13.2 - 2021/07/12

### Enhancement

* fluent-plugin-generate: Storage plugin was supported.
  https://github.com/fluent/fluentd/pull/3426
* parser_json: Added support to customize configuration of oj options.
  Use `FLUENT_OJ_OPTION_BIGDECIMAL_LOAD`, `FLUENT_OJ_OPTION_MAX_NESTING`,
  `FLUENT_OJ_OPTION_MODE`, and `FLUENT_OJ_OPTION_USE_TO_JSON` environment
  variable to configure it.
  https://github.com/fluent/fluentd/pull/3315

### Bug fix

* binlog_reader: Fixed a crash bug by missing "fluent/env" dependency.
  https://github.com/fluent/fluentd/pull/3443
* Fixed a crash bug on outputting log at the early stage when parsing
  config file.  This is a regression since v1.13.0. If you use invalid
  '@' prefix parameter, remove it as a workaround.
  https://github.com/fluent/fluentd/pull/3451
* in_tail: Fixed a bug that when rotation is occurred, remaining lines
  will be discarded if the throttling feature is enabled.
  https://github.com/fluent/fluentd/pull/3390
* fluent-plugin-generate: Fixed a crash bug during gemspec generation.
  It was unexpectedly introduced by #3305, thus this bug was a
  regression since 1.12.3.
  https://github.com/fluent/fluentd/pull/3444

### Misc

* Fixed the runtime dependency version of http_parse.rb to 0.7.0.
  It was fixed because false positive detection is occurred frequently
  by security scanning tools.
  https://github.com/fluent/fluentd/pull/3450

## Release v1.13.1 - 2021/06/25

### Bug fix

* out_forward: Fixed a race condition on handshake
  It's caused by using a same unpacker from multiple threads.
  https://github.com/fluent/fluentd/pull/3405
  https://github.com/fluent/fluentd/pull/3406
* in_tail: Fixed to remove too much verbose debugging logs
  It was unexpectedly introduced by #3185 log throttling feature.
  https://github.com/fluent/fluentd/pull/3418
* Fixed not to echo back the provides path as is on a 404 error
  There was a potential cross-site scripting vector even though
  it is quite difficult to exploit.
  https://github.com/fluent/fluentd/pull/3427

### Misc

* Pretty print for Fluent::Config::Section has been supported
  for debugging
  https://github.com/fluent/fluentd/pull/3398
* CI: Dropped to run CI for Ruby 2.5
  https://github.com/fluent/fluentd/pull/3412

## Release v1.13.0 - 2021/05/29

### Enhancement

* in_tail: Handle log throttling per file feature
  https://github.com/fluent/fluentd/pull/3185
  https://github.com/fluent/fluentd/pull/3364
  https://github.com/fluent/fluentd/pull/3379
* Extend to support service discovery manager in simpler way
  https://github.com/fluent/fluentd/pull/3299
  https://github.com/fluent/fluentd/pull/3362
* in_http: HTTP GET requests has been supported
  https://github.com/fluent/fluentd/pull/3373
* The log rotate settings in system configuration has been supported
  https://github.com/fluent/fluentd/pull/3352

### Bug fix

* Fix to disable `trace_instruction` when
  `RubyVM::InstructionSequence` is available. It improves
  compatibility with `truffleruby` some extent.
  https://github.com/fluent/fluentd/pull/3376
* in_tail: Safely skip files which are used by another process on
  Windows. It improves exception handling about
  `ERROR_SHARING_VIOLATION` on Windows.
  https://github.com/fluent/fluentd/pull/3378
* fluent-cat: the issue resending secondary file in specific format
  has been fixed
  https://github.com/fluent/fluentd/pull/3368
* in_tail: Shutdown immediately & safely even if reading huge files
  Note that `skip_refresh_on_startup` must be enabled.
  https://github.com/fluent/fluentd/pull/3380

### Misc

* example: Change a path to backup_path in counter_server correctly
  https://github.com/fluent/fluentd/pull/3359
* README: Update link to community forum to discuss.fluentd.org
  https://github.com/fluent/fluentd/pull/3360

# v1.12

## Release v1.12.4 - 2021/05/26

### Bug fix

* in_tail: Fix a bug that refresh_watcher fails to handle file rotations
  https://github.com/fluent/fluentd/pull/3393

## Release v1.12.3 - 2021/04/23

### Enhancement

* plugin_helper: Allow TLS to use keep-alive socket option
  https://github.com/fluent/fluentd/pull/3308

### Bug fix

* parser_csv, parser_syslog: Fix a naming conflict on parser_type
  https://github.com/fluent/fluentd/pull/3302
* in_tail: Fix incorrect error code & message on Windows
  https://github.com/fluent/fluentd/pull/3325
  https://github.com/fluent/fluentd/pull/3329
  https://github.com/fluent/fluentd/pull/3331
  https://github.com/fluent/fluentd/pull/3337
* in_tail: Fix a crash bug on catching a short-lived log
  https://github.com/fluent/fluentd/pull/3328
* storage_local: Fix position file corruption issue on concurrent gracefulReloads
  https://github.com/fluent/fluentd/pull/3335
* Fix incorrect warnings about ${chunk_id} with out_s3
  https://github.com/fluent/fluentd/pull/3339
* TLS Server: Add peer information to error log message
  https://github.com/fluent/fluentd/pull/3330

### Misc

* fluent-plugin-generate: add note about plugin name
  https://github.com/fluent/fluentd/pull/3303
* fluent-plugin-generate: Use same depended gem version with fluentd
  https://github.com/fluent/fluentd/pull/3305
* Fix some broken unit tests and improve CI's stability
  https://github.com/fluent/fluentd/pull/3304
  https://github.com/fluent/fluentd/pull/3307
  https://github.com/fluent/fluentd/pull/3312
  https://github.com/fluent/fluentd/pull/3313
  https://github.com/fluent/fluentd/pull/3314
  https://github.com/fluent/fluentd/pull/3316
  https://github.com/fluent/fluentd/pull/3336
* Permit to install with win32-service 2.2.0 on Windows
  https://github.com/fluent/fluentd/pull/3343

## Release v1.12.2 - 2021/03/29

### Enhancement

* out_copy: Add ignore_if_prev_successes
  https://github.com/fluent/fluentd/pull/3190
  https://github.com/fluent/fluentd/pull/3287
* Support multiple kind of timestamp format
  https://github.com/fluent/fluentd/pull/3252
* formatter_ltsv: suppress delimiters in output
  https://github.com/fluent/fluentd/pull/1666
  https://github.com/fluent/fluentd/pull/3288
  https://github.com/fluent/fluentd/pull/3289

### Bug fix

* in_tail: Expect ENOENT during stat
  https://github.com/fluent/fluentd/pull/3275
* out_forward: Prevent transferring duplicate logs on restart
  https://github.com/fluent/fluentd/pull/3267
  https://github.com/fluent/fluentd/pull/3285
* in_tail: Handle to send rotated logs when mv is used for rotating
  https://github.com/fluent/fluentd/pull/3294
* fluent-plugin-config-format: Fill an uninitialized instance variable
  https://github.com/fluent/fluentd/pull/3297
* Fix MessagePackEventStream issue with Enumerable methods
  https://github.com/fluent/fluentd/pull/2116

### Misc

* Add webrick to support Ruby 3.0
  https://github.com/fluent/fluentd/pull/3257
* Suggest Discourse instead of Google Groups
  https://github.com/fluent/fluentd/pull/3261
* Update MAINTAINERS.md
  https://github.com/fluent/fluentd/pull/3282
* Introduce DeepSource to check code quality
  https://github.com/fluent/fluentd/pull/3286
  https://github.com/fluent/fluentd/pull/3259
  https://github.com/fluent/fluentd/pull/3291
* Migrate to GitHub Actions and stabilize tests
  https://github.com/fluent/fluentd/pull/3266
  https://github.com/fluent/fluentd/pull/3268
  https://github.com/fluent/fluentd/pull/3281
  https://github.com/fluent/fluentd/pull/3283
  https://github.com/fluent/fluentd/pull/3290

## Release v1.12.1 - 2021/02/18

### Enhancement

* out_http: Add `headers_from_placeholders` parameter
  https://github.com/fluent/fluentd/pull/3241
* fluent-plugin-config-format: Add `--table` option to use markdown table
  https://github.com/fluent/fluentd/pull/3240
* Add `--disable-shared-socket`/`disable_shared_socket` to disable ServerEngine's shared socket setup
  https://github.com/fluent/fluentd/pull/3250

### Bug fix

* ca_generate: Fix creating TLS certification files which include broken extensions
  https://github.com/fluent/fluentd/pull/3246
* test: Drop TLS 1.1 tests
  https://github.com/fluent/fluentd/pull/3256
* Remove old gem constraints to support Ruby 3

### Misc

* Use GitHub Actions
  https://github.com/fluent/fluentd/pull/3233
  https://github.com/fluent/fluentd/pull/3255

## Release v1.12.0 - 2021/01/05

### New feature

* in_tail: Add `follow_inode` to support log rotation with wild card
  https://github.com/fluent/fluentd/pull/3182
* in_tail: Handle linux capability
  https://github.com/fluent/fluentd/pull/3155
  https://github.com/fluent/fluentd/pull/3162
* windows: Add win32 events alternative to unix signals
  https://github.com/fluent/fluentd/pull/3131

### Enhancement

* buffer: Enable metadata comparison optimization on all platforms
  https://github.com/fluent/fluentd/pull/3095
* fluent-plugin-config-formatter: Handle `service_discovery` type
  https://github.com/fluent/fluentd/pull/3178
* in_http: Add `add_query_params` parameter to add query params to event record
  https://github.com/fluent/fluentd/pull/3197
* inject: Support `unixtime_micros` and `unixtime_nanos` in `time_type`
  https://github.com/fluent/fluentd/pull/3220
* Refactoring code
  https://github.com/fluent/fluentd/pull/3167
  https://github.com/fluent/fluentd/pull/3170
  https://github.com/fluent/fluentd/pull/3180
  https://github.com/fluent/fluentd/pull/3196
  https://github.com/fluent/fluentd/pull/3213
  https://github.com/fluent/fluentd/pull/3222

### Bug fix

* output: Prevent retry.step from being called too many times in a short time
  https://github.com/fluent/fluentd/pull/3203

# v1.11

## Release v1.11.5 - 2020/11/06

### Enhancement

* formatter: Provide `newline` parameter to support `CRLF`
  https://github.com/fluent/fluentd/pull/3152
* out_http: adding support for intermediate certificates
  https://github.com/fluent/fluentd/pull/3146
* Update serverengine dependency to 2.2.2 or later

### Bug fix

* Fix a bug that windows service isn't stopped gracefully
  https://github.com/fluent/fluentd/pull/3156

## Release v1.11.4 - 2020/10/13

### Enhancement

* inject: Support `unixtime_millis` in `time_type` parameter
  https://github.com/fluent/fluentd/pull/3145

### Bug fix

* out_http: Fix broken data with `json_array true`
  https://github.com/fluent/fluentd/pull/3144
* output: Fix wrong logging issue for `${chunk_id}`
  https://github.com/fluent/fluentd/pull/3134

## Release v1.11.3 - 2020/09/30

### Enhancement

* in_exec: Add `connect_mode` parameter to read stderr
  https://github.com/fluent/fluentd/pull/3108
* parser_json: Improve the performance
  https://github.com/fluent/fluentd/pull/3109
* log: Add `ignore_same_log_interval` parameter
  https://github.com/fluent/fluentd/pull/3119
* Upgrade win32 gems
  https://github.com/fluent/fluentd/pull/3100
* Refactoring code
  https://github.com/fluent/fluentd/pull/3094
  https://github.com/fluent/fluentd/pull/3118

### Bug fix

* buffer: Fix calculation of timekey stats
  https://github.com/fluent/fluentd/pull/3018
* buffer: fix binmode usage for prevent gc
  https://github.com/fluent/fluentd/pull/3138

## Release v1.11.2 - 2020/08/04

### Enhancement

* `in_dummy` renamed to `in_sample`
  https://github.com/fluent/fluentd/pull/3065
* Allow regular expression in filter/match directive
  https://github.com/fluent/fluentd/pull/3071
* Refactoring code
  https://github.com/fluent/fluentd/pull/3051

### Bug fix

* buffer: Fix log message for `chunk_limit_records` case
  https://github.com/fluent/fluentd/pull/3079
* buffer: Fix timekey optimization for non-windows platform
  https://github.com/fluent/fluentd/pull/3092
* cert: Raise an error for broken certificate file
  https://github.com/fluent/fluentd/pull/3086
* cert: Set TLS ciphers list correctly on older OpenSSL
  https://github.com/fluent/fluentd/pull/3093

## Release v1.11.1 - 2020/06/22

### Enhancement

* in_http: Add `dump_error_log` parameter
  https://github.com/fluent/fluentd/pull/3035
* in_http: Improve time field handling
  https://github.com/fluent/fluentd/pull/3046
* Refactoring code
  https://github.com/fluent/fluentd/pull/3047

### Bug fix

* in_tail: Use actual path instead of based pattern for ignore list
  https://github.com/fluent/fluentd/pull/3042
* child_process helper: Fix child process failure due to SIGPIPE if the command uses stdout
  https://github.com/fluent/fluentd/pull/3044

## Release v1.11.0 - 2020/06/04

### New feature

* in_unix: Use v1 API
  https://github.com/fluent/fluentd/pull/2992

### Enhancement

* parser_syslog: Support any `time_format` for RFC3164 string parser
  https://github.com/fluent/fluentd/pull/3014
* parser_syslog: Add new parser for RFC5424
  https://github.com/fluent/fluentd/pull/3015
* Refactoring code
  https://github.com/fluent/fluentd/pull/3019

### Bug fix

* in_gc_stat: Add `use_symbol_keys` parameter to emit string key record
  https://github.com/fluent/fluentd/pull/3008

# v1.10

## Release v1.10.4 - 2020/05/12

### Enhancement

* out_http: Support single json array payload
  https://github.com/fluent/fluentd/pull/2973
* Refactoring
  https://github.com/fluent/fluentd/pull/2988

### Bug fix

* supervisor: Call `File.umask(0)` for standalone worker
  https://github.com/fluent/fluentd/pull/2987
* out_forward: Fix ZeroDivisionError issue with `weight 0`
  https://github.com/fluent/fluentd/pull/2989

## Release v1.10.3 - 2020/05/01

### Enhancement

* record_accessor: Add `set` method
  https://github.com/fluent/fluentd/pull/2977
* config: Ruby DSL format is deprecated
  https://github.com/fluent/fluentd/pull/2958
* Refactor code
  https://github.com/fluent/fluentd/pull/2961
  https://github.com/fluent/fluentd/pull/2962
  https://github.com/fluent/fluentd/pull/2965
  https://github.com/fluent/fluentd/pull/2966
  https://github.com/fluent/fluentd/pull/2978

### Bug fix

* out_forward: Disable `linger_timeout` setting on Windows
  https://github.com/fluent/fluentd/pull/2959
* out_forward: Fix warning of service discovery manager when fluentd stops
  https://github.com/fluent/fluentd/pull/2974

## Release v1.10.2 - 2020/04/15

### Enhancement

* out_copy: Add plugin_id to log message
  https://github.com/fluent/fluentd/pull/2934
* socket: Allow cert chains in mutual auth
  https://github.com/fluent/fluentd/pull/2930
* system: Add ignore_repeated_log_interval parameter
  https://github.com/fluent/fluentd/pull/2937
* windows: Allow to launch fluentd from whitespace included path
  https://github.com/fluent/fluentd/pull/2920
* Refactor code
  https://github.com/fluent/fluentd/pull/2935
  https://github.com/fluent/fluentd/pull/2936
  https://github.com/fluent/fluentd/pull/2938
  https://github.com/fluent/fluentd/pull/2939
  https://github.com/fluent/fluentd/pull/2946

### Bug fix

* in_syslog: Fix octet-counting mode bug
  https://github.com/fluent/fluentd/pull/2942
* out_forward: Create timer for purging obsolete sockets when keepalive_timeout is not set
  https://github.com/fluent/fluentd/pull/2943
* out_forward: Need authentication when sending tcp heartbeat with keepalive
  https://github.com/fluent/fluentd/pull/2945
* command: Fix fluent-debug start failure
  https://github.com/fluent/fluentd/pull/2948
* command: Fix regression of supervisor's worker and `--daemon` combo
  https://github.com/fluent/fluentd/pull/2950

## Release v1.10.1 - 2020/04/02

### Enhancement

* command: `--daemon` and `--no-supervisor` now work together
  https://github.com/fluent/fluentd/pull/2912
* Refactor code
  https://github.com/fluent/fluentd/pull/2913

### Bug fix

* in_tail: `Fix pos_file_compaction_interval` parameter type
  https://github.com/fluent/fluentd/pull/2921
* in_tail: Fix seek position update after compaction
  https://github.com/fluent/fluentd/pull/2922
* parser_syslog: Fix regression in the `with_priority` and RFC5424 case
  https://github.com/fluent/fluentd/pull/2923

### Misc

* Add document for security audit
  https://github.com/fluent/fluentd/pull/2911

## Release v1.10.0 - 2020/03/24

### New feature

* sd plugin: Add SRV record plugin
  https://github.com/fluent/fluentd/pull/2876

### Enhancement

* server: Add `cert_verifier` parameter for TLS transport
  https://github.com/fluent/fluentd/pull/2888
* parser_syslog: Support customized time format
  https://github.com/fluent/fluentd/pull/2886
* in_dummy: Delete `suspend` parameter
  https://github.com/fluent/fluentd/pull/2897
* Refactor code
  https://github.com/fluent/fluentd/pull/2858
  https://github.com/fluent/fluentd/pull/2862
  https://github.com/fluent/fluentd/pull/2864
  https://github.com/fluent/fluentd/pull/2869
  https://github.com/fluent/fluentd/pull/2870
  https://github.com/fluent/fluentd/pull/2874
  https://github.com/fluent/fluentd/pull/2881
  https://github.com/fluent/fluentd/pull/2885
  https://github.com/fluent/fluentd/pull/2894
  https://github.com/fluent/fluentd/pull/2896
  https://github.com/fluent/fluentd/pull/2898
  https://github.com/fluent/fluentd/pull/2899
  https://github.com/fluent/fluentd/pull/2900
  https://github.com/fluent/fluentd/pull/2901
  https://github.com/fluent/fluentd/pull/2906

### Bug fix

* out_forward: windows: Permit to specify `linger_timeout`
  https://github.com/fluent/fluentd/pull/2868
* parser_syslog: Fix syslog format detection
  https://github.com/fluent/fluentd/pull/2879
* buffer: Fix `available_buffer_space_ratio` calculation
  https://github.com/fluent/fluentd/pull/2882
* tls: Support CRLF based X.509 certificates
  https://github.com/fluent/fluentd/pull/2890
* msgpack_factory mixin: Fix performance penalty for deprecation log
  https://github.com/fluent/fluentd/pull/2903


# v1.9

## Release v1.9.3 - 2020/03/05

### Enhancement

* in_tail: Emit buffered lines as `unmatched_line` at shutdown phase when `emit_unmatched_lines true`
  https://github.com/fluent/fluentd/pull/2837
* Specify directory mode explicitly
  https://github.com/fluent/fluentd/pull/2827
* server helper: Change SSLError log level to warn in accept
  https://github.com/fluent/fluentd/pull/2861
* Refactor code
  https://github.com/fluent/fluentd/pull/2829
  https://github.com/fluent/fluentd/pull/2830
  https://github.com/fluent/fluentd/pull/2832
  https://github.com/fluent/fluentd/pull/2836
  https://github.com/fluent/fluentd/pull/2838
  https://github.com/fluent/fluentd/pull/2842
  https://github.com/fluent/fluentd/pull/2843

### Bug fix

* buffer: Add seq to metadata that it can be unique
  https://github.com/fluent/fluentd/pull/2824
  https://github.com/fluent/fluentd/pull/2853
* buffer: Use `Tempfile` as binmode for decompression
  https://github.com/fluent/fluentd/pull/2847

### Misc

* Add `.idea` to git ignore file
  https://github.com/fluent/fluentd/pull/2834
* appveyor: Fix tests
  https://github.com/fluent/fluentd/pull/2853
  https://github.com/fluent/fluentd/pull/2855
* Update pem for test
  https://github.com/fluent/fluentd/pull/2839

## Release v1.9.2 - 2020/02/13

### Enhancement

* in_tail: Add `pos_file_compaction_interval` parameter for auto compaction
  https://github.com/fluent/fluentd/pull/2805
* command: Use given encoding when RUBYOPT has `-E`
  https://github.com/fluent/fluentd/pull/2814

### Bug fix

* command: Accept RUBYOPT with two or more options
  https://github.com/fluent/fluentd/pull/2807
* command: Fix infinite loop bug when RUBYOPT is invalid
  https://github.com/fluent/fluentd/pull/2813
* log: serverengine's log should be formatted with the same format of fluentd
  https://github.com/fluent/fluentd/pull/2812
* in_http: Fix `NoMethodError` when `OPTIONS` request doesn't have 'Origin' header
  https://github.com/fluent/fluentd/pull/2823
* parser_syslog: Improved for parsing RFC5424 structured data in `parser_syslog`
  https://github.com/fluent/fluentd/pull/2816

## Release v1.9.1 - 2020/01/31

### Enhancement

* http_server helper: Support HTTPS
  https://github.com/fluent/fluentd/pull/2787
* in_tail: Add `path_delimiter` to split with any char
  https://github.com/fluent/fluentd/pull/2796
* in_tail: Remove an entry from PositionFile when it is unwatched
  https://github.com/fluent/fluentd/pull/2803
* out_http: Add warning for `retryable_response_code`
  https://github.com/fluent/fluentd/pull/2809
* parser_syslog: Add multiline RFC5424 support
  https://github.com/fluent/fluentd/pull/2767
* Add TLS module to unify TLS related code
  https://github.com/fluent/fluentd/pull/2802

### Bug fix

* output: Add `EncodingError` to unrecoverable errors
  https://github.com/fluent/fluentd/pull/2808
* tls: Fix TLS version handling in secure mode
  https://github.com/fluent/fluentd/pull/2802

## Release v1.9.0 - 2020/01/22

### New feature

* New light-weight config reload mechanism
  https://github.com/fluent/fluentd/pull/2716
* Drop ruby 2.1/2.2/2.3 support
  https://github.com/fluent/fluentd/pull/2750

### Enhancement

* output: Show better message for secondary warning
  https://github.com/fluent/fluentd/pull/2751
* Use `ext_monitor` gem if it is installed. For ruby 2.6 or earlier
  https://github.com/fluent/fluentd/pull/2670
* Support Ruby's Time class in msgpack serde
  https://github.com/fluent/fluentd/pull/2775
* Clean up code/test
  https://github.com/fluent/fluentd/pull/2753
  https://github.com/fluent/fluentd/pull/2763
  https://github.com/fluent/fluentd/pull/2764
  https://github.com/fluent/fluentd/pull/2780

### Bug fix

* buffer: Disable the optimization of Metadata instance comparison on Windows
  https://github.com/fluent/fluentd/pull/2778
* output/buffer: Fix stage size computation
  https://github.com/fluent/fluentd/pull/2734
* server: Ignore Errno::EHOSTUNREACH in TLS accept to avoid fluentd restart
  https://github.com/fluent/fluentd/pull/2773
* server: Fix IPv6 dual stack mode issue for udp socket
  https://github.com/fluent/fluentd/pull/2781
* config: Support @include/include directive for spaces included path
  https://github.com/fluent/fluentd/pull/2780


# v1.8

## Release v1.8.1 - 2019/12/26

### Enhancement

* in_tail: Add `path_timezone` parameter to format `path` with the specified timezone
  https://github.com/fluent/fluentd/pull/2719
* out_copy: Add `copy_mode` parameter. `deep_copy` parameter is now deprecated.
  https://github.com/fluent/fluentd/pull/2747
* supervisor: Add deprecated log for `inline_config`
  https://github.com/fluent/fluentd/pull/2746

### Bug fixes

* parser_ltsv: Prevent garbage result by checking `label_delimiter`
  https://github.com/fluent/fluentd/pull/2748

## Release v1.8.0 - 2019/12/11

### New feature

* Add service discovery plugin and `out_forward` use it
  https://github.com/fluent/fluentd/pull/2541
* config: Add strict mode and support `default`/`nil` value in ruby embedded mode
  https://github.com/fluent/fluentd/pull/2685

### Enhancement

* formatter_csv: Support nested fields
  https://github.com/fluent/fluentd/pull/2643
* record_accessor helper: Make code simple and bit faster
  https://github.com/fluent/fluentd/pull/2660
* Relax tzinfo dependency to accept v1
  https://github.com/fluent/fluentd/pull/2673
* log: Deprecate top-level match for capturing fluentd logs
  https://github.com/fluent/fluentd/pull/2689
* in_monitor_agent: Expose Fluentd version in REST API
  https://github.com/fluent/fluentd/pull/2706
* time: Accept localtime xor utc
  https://github.com/fluent/fluentd/pull/2720
  https://github.com/fluent/fluentd/pull/2731
* formatter_stdout: Make time_format configurable in stdout format
  https://github.com/fluent/fluentd/pull/2721
* supervisor: create log directory when it doesn't exists
  https://github.com/fluent/fluentd/pull/2732
* clean up internal classes / methods / code
  https://github.com/fluent/fluentd/pull/2647
  https://github.com/fluent/fluentd/pull/2648
  https://github.com/fluent/fluentd/pull/2653
  https://github.com/fluent/fluentd/pull/2654
  https://github.com/fluent/fluentd/pull/2657
  https://github.com/fluent/fluentd/pull/2667
  https://github.com/fluent/fluentd/pull/2674
  https://github.com/fluent/fluentd/pull/2677
  https://github.com/fluent/fluentd/pull/2680
  https://github.com/fluent/fluentd/pull/2709
  https://github.com/fluent/fluentd/pull/2730

### Bug fixes

* output: Fix warning printed when chunk key placeholder not replaced
  https://github.com/fluent/fluentd/pull/2523
  https://github.com/fluent/fluentd/pull/2733
* Fix dry-run mode
  https://github.com/fluent/fluentd/pull/2651
* suppress warning
  https://github.com/fluent/fluentd/pull/2652
* suppress keyword argument warning for ruby2.7
  https://github.com/fluent/fluentd/pull/2664
* RPC: Fix debug log text
  https://github.com/fluent/fluentd/pull/2666
* time: Properly show class names in error message
  https://github.com/fluent/fluentd/pull/2671
* Fix a potential bug that ThreadError may occur on SIGUSR1
  https://github.com/fluent/fluentd/pull/2678
* server helper: Ignore ECONNREFUSED in TLS accept to avoid fluentd restart
  https://github.com/fluent/fluentd/pull/2695
* server helper: Fix IPv6 dual stack mode issue for tcp socket.
  https://github.com/fluent/fluentd/pull/2697
* supervisor: Fix inline config handling
  https://github.com/fluent/fluentd/pull/2708
* Fix typo
  https://github.com/fluent/fluentd/pull/2710
  https://github.com/fluent/fluentd/pull/2714

# v1.7

## Release v1.7.4 - 2019/10/24

### Enhancement

* in_http: Add `use_204_response` parameter to return proper 204 response instead of 200.
  fluentd v2 will change this parameter to `true`.
  https://github.com/fluent/fluentd/pull/2640

### Bug fixes

* child_process helper: fix stderr blocking for discard case
  https://github.com/fluent/fluentd/pull/2649
* log: Fix log rotation handling on Windows
  https://github.com/fluent/fluentd/pull/2663

## Release v1.7.3 - 2019/10/01

### Enhancement

* in_syslog: Replace priority_key with severity_key
  https://github.com/fluent/fluentd/pull/2636

### Bug fixes

* out_forward: Fix nil error after purge obsoleted sockets in socket cache
  https://github.com/fluent/fluentd/pull/2635
* fix typo in ChangeLog
  https://github.com/fluent/fluentd/pull/2633

## Release v1.7.2 - 2019/09/19

### Enhancement

* in_tcp: Add security/client to restrict access
  https://github.com/fluent/fluentd/pull/2622

### Bug fixes

* buf_file/buf_file_single: fix to handle compress data during restart
  https://github.com/fluent/fluentd/pull/2620
* plugin: Use `__send__` to avoid conflict with user defined `send`
  https://github.com/fluent/fluentd/pull/2614
* buffer: reject invalid timekey at configure phase
  https://github.com/fluent/fluentd/pull/2615


## Release v1.7.1 - 2019/09/08

### Enhancement

* socket helper/out_forward: Support Windows certstore to load certificates
  https://github.com/fluent/fluentd/pull/2601
* parser_syslog: Add faster parser for rfc3164 message
  https://github.com/fluent/fluentd/pull/2599

### Bug fixes

* buf_file/buf_file_single: fix to ignore placeholder based path.
  https://github.com/fluent/fluentd/pull/2594
* server helper: Ignore ETIMEDOUT error in SSL_accept
  https://github.com/fluent/fluentd/pull/2595
* buf_file: ensure to remove metadata after buffer creation failure
  https://github.com/fluent/fluentd/pull/2598
* buf_file_single: fix duplicated path setting check
  https://github.com/fluent/fluentd/pull/2600
* fix msgpack-ruby dependency to use recent feature
  https://github.com/fluent/fluentd/pull/2606


## Release v1.7.0 - 2019/08/20

### New feature

* buffer: Add file_single buffer plugin
  https://github.com/fluent/fluentd/pull/2579
* output: Add http output plugin
  https://github.com/fluent/fluentd/pull/2488

### Enhancement

* buffer: Improve the performance of buffer routine
  https://github.com/fluent/fluentd/pull/2560
  https://github.com/fluent/fluentd/pull/2563
  https://github.com/fluent/fluentd/pull/2564
* output: Use Mutex instead of Monitor
  https://github.com/fluent/fluentd/pull/2561
* event: Add `OneEventStrea#empty?` method
  https://github.com/fluent/fluentd/pull/2565
* thread: Set thread name for ruby 2.3 or later
  https://github.com/fluent/fluentd/pull/2574
* core: Cache msgpack packer/unpacker to avoid the object allocation
  https://github.com/fluent/fluentd/pull/2559
* time: Use faster way to get sec and nsec
  https://github.com/fluent/fluentd/pull/2557
* buf_file: Reduce IO flush by removing `IO#truncate`
  https://github.com/fluent/fluentd/pull/2551
* in_tcp: Improve the performance for multiple event case
  https://github.com/fluent/fluentd/pull/2567
* in_syslog: support `source_hostname_key` and `source_address_key` for unmatched event
  https://github.com/fluent/fluentd/pull/2553
* formatter_csv: Improve the format performance.
  https://github.com/fluent/fluentd/pull/2529
* parser_csv: Add fast parser for typical cases
  https://github.com/fluent/fluentd/pull/2535
* out_forward: Refactor code
  https://github.com/fluent/fluentd/pull/2516
  https://github.com/fluent/fluentd/pull/2532

### Bug fixes

* output: fix data lost on decompression
  https://github.com/fluent/fluentd/pull/2547
* out_exec_filter: fix non-ascii encoding issue
  https://github.com/fluent/fluentd/pull/2539
* in_tail: Don't call parser's configure twice
  https://github.com/fluent/fluentd/pull/2569
* Fix unused message handling for <section> parameters
  https://github.com/fluent/fluentd/pull/2578
* Fix comment/message typos
  https://github.com/fluent/fluentd/pull/2549
  https://github.com/fluent/fluentd/pull/2554
  https://github.com/fluent/fluentd/pull/2556
  https://github.com/fluent/fluentd/pull/2566
  https://github.com/fluent/fluentd/pull/2573
  https://github.com/fluent/fluentd/pull/2576
  https://github.com/fluent/fluentd/pull/2583

# v1.6

## Release v1.6.3 - 2019/07/29

### Enhancement

* in_syslog: Add `emit_unmatched_lines` parameter
  https://github.com/fluent/fluentd/pull/2499
* buf_file: Add `path_suffix` parameter
  https://github.com/fluent/fluentd/pull/2524
* in_tail: Improve the performance of split lines
  https://github.com/fluent/fluentd/pull/2527

### Bug fixes

* http_server: Fix re-define render_json method
  https://github.com/fluent/fluentd/pull/2517

## Release v1.6.2 - 2019/07/11

### Bug fixes

* http_server helper: Add title argument to support multiple servers
  https://github.com/fluent/fluentd/pull/2493

## Release v1.6.1 - 2019/07/10

### Enhancement

* socket/cert: Support all private keys OpenSSL supports, not only RSA.
  https://github.com/fluent/fluentd/pull/2487
* output/buffer: Improve statistics method performance
  https://github.com/fluent/fluentd/pull/2491

### Bug fixes

* plugin_config_formatter: update new doc URL
  https://github.com/fluent/fluentd/pull/2481
* out_forward: Avoid zero division error when there are no available nodes
  https://github.com/fluent/fluentd/pull/2482

## Release v1.6.0 - 2019/07/01

### New feature

* plugin: Add http_server helper and in_monitor_agent use it
  https://github.com/fluent/fluentd/pull/2447

### Enhancement

* in_monitor_agent: Add more metrics for buffer/output
  https://github.com/fluent/fluentd/pull/2450
* time/plugin: Add `EventTime#to_time` method for fast conversion
  https://github.com/fluent/fluentd/pull/2469
* socket helper/out_forward: Add connect_timeout parameter
  https://github.com/fluent/fluentd/pull/2467
* command: Add `--conf-encoding` option
  https://github.com/fluent/fluentd/pull/2453
* parser_none: Small performance optimization
  https://github.com/fluent/fluentd/pull/2455

### Bug fixes

* cert: Fix cert match pattern
  https://github.com/fluent/fluentd/pull/2466
* output: Fix forget to increment rollback count
  https://github.com/fluent/fluentd/pull/2462

# v1.5

## Release v1.5.2 - 2019/06/13

### Bug fixes

* out_forward: Fix duplicated handshake bug in keepalive
  https://github.com/fluent/fluentd/pull/2456

## Release v1.5.1 - 2019/06/05

### Enhancement

* in_tail: Increase read block size to reduce IO call
  https://github.com/fluent/fluentd/pull/2418
* in_monitor_agent: Refactor code
  https://github.com/fluent/fluentd/pull/2422

### Bug fixes

* out_forward: Fix socket handling of keepalive
  https://github.com/fluent/fluentd/pull/2434
* parser: Fix the use of name based timezone
  https://github.com/fluent/fluentd/pull/2421
* in_monitor_agent: Fix debug parameter handling
  https://github.com/fluent/fluentd/pull/2423
* command: Fix error handling of log rotation age option
  https://github.com/fluent/fluentd/pull/2427
* command: Fix ERB warning for ruby 2.6 or later
  https://github.com/fluent/fluentd/pull/2430

## Release v1.5.0 - 2019/05/18

### New feature

* out_forward: Support keepalive feature
  https://github.com/fluent/fluentd/pull/2393
* in_http: Support TLS via server helper
  https://github.com/fluent/fluentd/pull/2395
* in_syslog: Support TLS via server helper
  https://github.com/fluent/fluentd/pull/2399

### Enhancement

* in_syslog: Add delimiter parameter
  https://github.com/fluent/fluentd/pull/2378
* in_forward: Add tag/add_tag_prefix parameters
  https://github.com/fluent/fluentd/pull/2396
* parser_json: Add stream_buffer_size parameter for yajl
  https://github.com/fluent/fluentd/pull/2381
* command: Add deprecated message to show-plugin-config option
  https://github.com/fluent/fluentd/pull/2401
* storage_local: Ignore empty file. Call sync after write for XFS.
  https://github.com/fluent/fluentd/pull/2409

### Bug fixes

* out_forward: Don't use SO_LINGER on SSL/TLS WinSock
  https://github.com/fluent/fluentd/pull/2398
* server helper: Fix recursive lock issue in TLSServer
  https://github.com/fluent/fluentd/pull/2341
* Fix typo
  https://github.com/fluent/fluentd/pull/2369

# v1.4

## Release v1.4.2 - 2019/04/02

### Enhancements

* in_http: subdomain support in CORS domain
  https://github.com/fluent/fluentd/pull/2337
* in_monitor_agent: Expose current timekey list as a buffer metrics
  https://github.com/fluent/fluentd/pull/2343
* in_tcp/in_udp: Add source_address_key parameter
  https://github.com/fluent/fluentd/pull/2347
* in_forward: Add send_keepalive_packet parameter to check the remote connection is available or not
  https://github.com/fluent/fluentd/pull/2352

### Bug fixes

* out_exec_filter: Fix typo of child_respawn description
  https://github.com/fluent/fluentd/pull/2341
* in_tail: Create parent directories for symlink
  https://github.com/fluent/fluentd/pull/2353
* in_tail: Fix encoding duplication check for non-specified case
  https://github.com/fluent/fluentd/pull/2361
* log: Fix time format handling of plugin logger when log format is JSON
  https://github.com/fluent/fluentd/pull/2356

## Release v1.4.1 - 2019/03/18

### Enhancements

* system: Add worker_id to process_name when workers is larger than 1
  https://github.com/fluent/fluentd/pull/2321
* parser_regexp: Check named captures. When no named captures, configuration error is raised
  https://github.com/fluent/fluentd/pull/2331

### Bug fixes

* out_forward: Make tls_client_private_key_passphrase secret
  https://github.com/fluent/fluentd/pull/2324
* in_syslog: Check message length when read from buffer in octet counting
  https://github.com/fluent/fluentd/pull/2323

## Release v1.4.0 - 2019/02/24

### New features

* multiprocess: Support <worker N-M> syntax
  https://github.com/fluent/fluentd/pull/2292
* output: Work <secondary> and retry_forever together
  https://github.com/fluent/fluentd/pull/2276
* out_file: Support placeholders in symlink_path
  https://github.com/fluent/fluentd/pull/2254

### Enhancements

* output: Add MessagePack unpacker error to unrecoverable error list
  https://github.com/fluent/fluentd/pull/2301
* output: Reduce flush delay when large timekey and small timekey_wait are specified
  https://github.com/fluent/fluentd/pull/2291
* config: Support embedded ruby code in section argument.
  https://github.com/fluent/fluentd/pull/2295
* in_tail: Improve encoding parameter handling
  https://github.com/fluent/fluentd/pull/2305
* in_tcp/in_udp: Add <parse> section check
  https://github.com/fluent/fluentd/pull/2267

### Bug fixes

* server: Ignore IOError and related errors in UDP
  https://github.com/fluent/fluentd/pull/2310
* server: Ignore EPIPE in TLS accept to avoid fluentd restart
  https://github.com/fluent/fluentd/pull/2253

# v1.3

## Release v1.3.3 - 2019/01/06

### Enhancements

* parser_syslog: Use String#squeeze for performance improvement
  https://github.com/fluent/fluentd/pull/2239
* parser_syslog: Support RFC5424 timestamp without subseconds
  https://github.com/fluent/fluentd/pull/2240

### Bug fixes

* server: Ignore ECONNRESET in TLS accept to avoid fluentd restart
  https://github.com/fluent/fluentd/pull/2243
* log: Fix plugin logger ignores fluentd log event setting
  https://github.com/fluent/fluentd/pull/2252

## Release v1.3.2 - 2018/12/10

### Enhancements

* out_forward: Support mutual TLS
  https://github.com/fluent/fluentd/pull/2187
* out_file: Create `pos_file` directory if it doesn't exist
  https://github.com/fluent/fluentd/pull/2223

### Bug fixes

* output: Fix logs during retry
  https://github.com/fluent/fluentd/pull/2203

## Release v1.3.1 - 2018/11/27

### Enhancements

* out_forward: Separate parameter names for certificate
  https://github.com/fluent/fluentd/pull/2181
  https://github.com/fluent/fluentd/pull/2190
* out_forward: Add `verify_connection_at_startup` parameter to check connection setting at startup phase
  https://github.com/fluent/fluentd/pull/2184
* config: Check right slash position in regexp type
  https://github.com/fluent/fluentd/pull/2176
* parser_nginx: Support multiple IPs in `http_x_forwarded_for` field
  https://github.com/fluent/fluentd/pull/2171

### Bug fixes

* fluent-cat: Fix retry limit handling
  https://github.com/fluent/fluentd/pull/2193
* record_accessor helper: Delete top level field with bracket style
  https://github.com/fluent/fluentd/pull/2192
* filter_record_transformer: Keep `class` method to avoid undefined method error
  https://github.com/fluent/fluentd/pull/2186

## Release v1.3.0 - 2018/11/10

### New features

* output: Change thread execution control
  https://github.com/fluent/fluentd/pull/2170
* in_syslog: Support octet counting frame
  https://github.com/fluent/fluentd/pull/2147
* Use `flush_thread_count` value for `queued_chunks_limit_size` when `queued_chunks_limit_size` is not specified
  https://github.com/fluent/fluentd/pull/2173

### Enhancements

* output: Show backtrace for unrecoverable errors
  https://github.com/fluent/fluentd/pull/2149
* in_http: Implement support for CORS preflight requests
  https://github.com/fluent/fluentd/pull/2144

### Bug fixes

* server: Fix deadlock between on_writable and close in sockets
  https://github.com/fluent/fluentd/pull/2165
* output: show correct error when wrong plugin is specified for secondary
  https://github.com/fluent/fluentd/pull/2169

# v1.2

## Release v1.2.6 - 2018/10/03

### Enhancements

* output: Add `disable_chunk_backup` for ignore broken chunks.
  https://github.com/fluent/fluentd/pull/2117
* parser_syslog: Improve regexp for RFC5424
  https://github.com/fluent/fluentd/pull/2141
* in_http: Allow specifying the wildcard '*' as the CORS domain
  https://github.com/fluent/fluentd/pull/2139

### Bug fixes

* in_tail: Prevent thread switching in the interval between seek and read/write operations to pos_file
  https://github.com/fluent/fluentd/pull/2118
* parser: Handle LoadError properly for oj
  https://github.com/fluent/fluentd/pull/2140

## Release v1.2.5 - 2018/08/22

### Bug fixes

* in_tail: Fix resource leak by file rotation
  https://github.com/fluent/fluentd/pull/2105
* fix typos

## Release v1.2.4 - 2018/08/01

### Bug fixes

* output: Consider timezone when calculate timekey
  https://github.com/fluent/fluentd/pull/2054
* output: Fix bug in suppress_emit_error_log_interval
  https://github.com/fluent/fluentd/pull/2069
* server-helper: Fix connection leak by close timing issue.
  https://github.com/fluent/fluentd/pull/2087

## Release v1.2.3 - 2018/07/10

### Enhancements

* in_http: Consider `<parse>` parameters in batch mode
  https://github.com/fluent/fluentd/pull/2055
* in_http: Support gzip payload
  https://github.com/fluent/fluentd/pull/2060
* output: Improve compress performance
  https://github.com/fluent/fluentd/pull/2031
* in_monitor_agent: Add missing descriptions for configurable options
  https://github.com/fluent/fluentd/pull/2037
* parser_syslog: update regex of pid field for conformance to RFC5424 spec
  https://github.com/fluent/fluentd/pull/2051

### Bug fixes

* in_tail: Fix to rescue Errno::ENOENT for File.mtime()
  https://github.com/fluent/fluentd/pull/2063
* fluent-plugin-generate: Fix Parser plugin template
  https://github.com/fluent/fluentd/pull/2026
* fluent-plugin-config-format: Fix NoMethodError for some plugins
  https://github.com/fluent/fluentd/pull/2023
* config: Don't warn message for reserved parameters in DSL
  https://github.com/fluent/fluentd/pull/2034

## Release v1.2.2 - 2018/06/12

### Enhancements

* filter_parser: Add remove_key_name_field parameter
  https://github.com/fluent/fluentd/pull/2012
* fluent-plugin-config-format: Dump config_argument
  https://github.com/fluent/fluentd/pull/2003

### Bug fixes

* in_tail: Change pos file entry handling to avoid read conflict for other plugins
  https://github.com/fluent/fluentd/pull/1963
* buffer: Wait for all chunks being purged before deleting @queued_num items
  https://github.com/fluent/fluentd/pull/2016

## Release v1.2.1 - 2018/05/23

### Enhancements

* Counter: Add wait API to client
  https://github.com/fluent/fluentd/pull/1997

### Bug fixes

* in_tcp/in_udp: Fix source_hostname_key to set hostname correctly
  https://github.com/fluent/fluentd/pull/1976
* in_monitor_agent: Fix buffer_total_queued_size calculation
  https://github.com/fluent/fluentd/pull/1990
* out_file: Temporal fix for broken gzipped files with gzip and append
  https://github.com/fluent/fluentd/pull/1995
* test: Fix unstable backup test
  https://github.com/fluent/fluentd/pull/1979
* gemspec: Remove deprecated has_rdoc

## Release v1.2.0 - 2018/04/30

### New Features

* New Counter API
  https://github.com/fluent/fluentd/pull/1857
* output: Backup for broken chunks
  https://github.com/fluent/fluentd/pull/1952
* filter_grep: Support for `<and>` and `<or>` sections
  https://github.com/fluent/fluentd/pull/1897
* config: Support `regexp` type in configuration parameter
  https://github.com/fluent/fluentd/pull/1927

### Enhancements

* parser_nginx: Support optional `http-x-forwarded-for` field
  https://github.com/fluent/fluentd/pull/1932
* filter_grep: Improve the performance
  https://github.com/fluent/fluentd/pull/1940

### Bug fixes

* log: Fix unexpected implementation bug when log rotation setting is applied
  https://github.com/fluent/fluentd/pull/1957
* server helper: Close invalid socket when ssl error happens on reading
  https://github.com/fluent/fluentd/pull/1942
* output: Buffer chunk's unique id should be formatted as hex in the log

# v1.1

## Release v1.1.3 - 2018/04/03

### Enhancements

* output: Support negative index for tag placeholders
  https://github.com/fluent/fluentd/pull/1908
* buffer: Add queued_chunks_limit_size to control the number of queued chunks
  https://github.com/fluent/fluentd/pull/1916
* time: Make Fluent::EventTime human readable for inspect
  https://github.com/fluent/fluentd/pull/1915

### Bug fixes

* output: Delete empty queued_num field after purging chunks
  https://github.com/fluent/fluentd/pull/1919
* fluent-debug: Fix usage message of fluent-debug command
  https://github.com/fluent/fluentd/pull/1920
* out_forward: The node should be disabled when TLS socket for ack returns an error
  https://github.com/fluent/fluentd/pull/1925

## Release v1.1.2 - 2018/03/18

### Enhancements

* filter_grep: Support pattern starts with character classes with //
  https://github.com/fluent/fluentd/pull/1887

### Bug fixes

* in_tail: Handle records in the correct order on file rotation
  https://github.com/fluent/fluentd/pull/1880
* out_forward: Fix race condition with `<security>` on multi thread environment
  https://github.com/fluent/fluentd/pull/1893
* output: Prevent flushing threads consume too much CPU when retry happens
  https://github.com/fluent/fluentd/pull/1901
* config: Fix boolean param handling for comment without value
  https://github.com/fluent/fluentd/pull/1883
* test: Fix random test failures in test/plugin/test_out_forward.rb
  https://github.com/fluent/fluentd/pull/1881
  https://github.com/fluent/fluentd/pull/1890
* command: Fix typo in binlog_reader
  https://github.com/fluent/fluentd/pull/1898

## Release v1.1.1 - 2018/03/05

### Enhancements

* in_debug_agent: Support multi worker environment
  https://github.com/fluent/fluentd/pull/1869
* in_forward: Improve SSL setup to support mutual TLS
  https://github.com/fluent/fluentd/pull/1861
* buf_file: Skip and delete broken file chunks to avoid unsuccessful retry in resume
  https://github.com/fluent/fluentd/pull/1874
* command: Show fluentd version for debug purpose
  https://github.com/fluent/fluentd/pull/1839

### Bug fixes

* in_forward: Do not close connection until write is complete on failed auth PONG
  https://github.com/fluent/fluentd/pull/1835
* in_tail: Fix IO event race condition during shutdown
  https://github.com/fluent/fluentd/pull/1876
* in_http: Emit event time instead of raw time value in batch
  https://github.com/fluent/fluentd/pull/1850
* parser_json: Add EncodingError to rescue list for oj 3.x.
  https://github.com/fluent/fluentd/pull/1875
* config: Fix config_param for string type with frozen string
  https://github.com/fluent/fluentd/pull/1838
* timer: Fix a bug to leak non-repeating timer watchers
  https://github.com/fluent/fluentd/pull/1864

## Release v1.1.0 - 2018/01/17

### New features / Enhancements

* config: Add hostname and worker_id short-cut
  https://github.com/fluent/fluentd/pull/1814
* parser_ltsv: Add delimiter_pattern parameter
  https://github.com/fluent/fluentd/pull/1802
* record_accessor helper: Support nested field deletion
  https://github.com/fluent/fluentd/pull/1800
* record_accessor helper: Expose internal instance `@keys` variable
  https://github.com/fluent/fluentd/pull/1808
* log: Improve Log#on_xxx API performance
  https://github.com/fluent/fluentd/pull/1809
* time: Improve time formatting performance
  https://github.com/fluent/fluentd/pull/1796
* command: Port certificates generating command from secure-forward
  https://github.com/fluent/fluentd/pull/1818

### Bug fixes

* server helper: Fix TCP + TLS degradation
  https://github.com/fluent/fluentd/pull/1805
* time: Fix the method for TimeFormatter#call
  https://github.com/fluent/fluentd/pull/1813

# v1.0

## Release v1.0.2 - 2017/12/17

### New features / Enhancements

* Use dig_rb instead of ruby_dig to support dig method in more objects
  https://github.com/fluent/fluentd/pull/1794

## Release v1.0.1 - 2017/12/14

### New features / Enhancements

* in_udp: Add receive_buffer_size parameter
  https://github.com/fluent/fluentd/pull/1788
* in_tail: Add enable_stat_watcher option to disable inotify events
  https://github.com/fluent/fluentd/pull/1775
* Relax strptime gem version

### Bug fixes

* in_tail: Properly handle moved back and truncated case
  https://github.com/fluent/fluentd/pull/1793
* out_forward: Rebuild weight array to apply server setting properly
  https://github.com/fluent/fluentd/pull/1784
* fluent-plugin-config-formatter: Use v1.0 for URL
  https://github.com/fluent/fluentd/pull/1781

## Release v1.0.0 - 2017/12/6

See [CNCF announcement](https://www.cncf.io/blog/2017/12/06/fluentd-v1-0/) :)

### New features / Enhancements

* out_copy: Support ignore_error argument in `<store>`
  https://github.com/fluent/fluentd/pull/1764
* server helper: Improve resource usage of TLS transport
  https://github.com/fluent/fluentd/pull/1764
* Disable tracepoint feature to omit unnecessary insts
  https://github.com/fluent/fluentd/pull/1764

### Bug fixes

* out_forward: Don't update retry state when failed to get ack response.
  https://github.com/fluent/fluentd/pull/1686
* plugin: Combine before_shutdown and shutdown call in one sequence.
  https://github.com/fluent/fluentd/pull/1763
* Add description to parsers
  https://github.com/fluent/fluentd/pull/1776
  https://github.com/fluent/fluentd/pull/1777
  https://github.com/fluent/fluentd/pull/1778
  https://github.com/fluent/fluentd/pull/1779
  https://github.com/fluent/fluentd/pull/1780
* filter_parser: Add parameter description
  https://github.com/fluent/fluentd/pull/1773
* plugin: Combine before_shutdown and shutdown call in one sequence.
  https://github.com/fluent/fluentd/pull/1763

# v0.14

## Release v0.14.25 - 2017/11/29

### New features / Enhancements

* Disable tracepoint feature to omit unnecessary insts
  https://github.com/fluent/fluentd/pull/1764

### Bug fixes

* out_forward: Don't update retry state when failed to get ack response.
  https://github.com/fluent/fluentd/pull/1686
* plugin: Combine before_shutdown and shutdown call in one sequence.
  https://github.com/fluent/fluentd/pull/1763

## Release v0.14.24 - 2017/11/24

### New features / Enhancements

* plugin-config-formatter: Add link to plugin helper result
  https://github.com/fluent/fluentd/pull/1753
* server helper: Refactor code
  https://github.com/fluent/fluentd/pull/1759

### Bug fixes

* supervisor: Don't call change_privilege twice
  https://github.com/fluent/fluentd/pull/1757

## Release v0.14.23 - 2017/11/15

### New features / Enhancements

* in_udp: Add remove_newline parameter
  https://github.com/fluent/fluentd/pull/1747

### Bug fixes

* buffer: Lock buffers in order of metadata
  https://github.com/fluent/fluentd/pull/1722
* in_tcp: Fix log corruption under load.
  https://github.com/fluent/fluentd/pull/1729
* out_forward: Fix elapsed time miscalculation in tcp heartbeat
  https://github.com/fluent/fluentd/pull/1738
* supervisor: Fix worker pid handling during worker restart
  https://github.com/fluent/fluentd/pull/1739
* in_tail: Skip setup failed watcher to avoid resource leak and log bloat
  https://github.com/fluent/fluentd/pull/1742
* agent: Add error location to emit error logs
  https://github.com/fluent/fluentd/pull/1746
* command: Consider hyphen and underscore in fluent-plugin-generate arguments
  https://github.com/fluent/fluentd/pull/1751

## Release v0.14.22 - 2017/11/01

### New features / Enhancements

* formatter_tsv: Add add_newline parameter
  https://github.com/fluent/fluentd/pull/1691
* out_file/out_secondary_file: Support ${chunk_id} placeholder. This includes extract_placeholders API change
  https://github.com/fluent/fluentd/pull/1708
* record_accessor: Support double quotes in bracket notation
  https://github.com/fluent/fluentd/pull/1716
* log: Show running ruby version in startup log
  https://github.com/fluent/fluentd/pull/1717
* log: Log message when chunk is created
  https://github.com/fluent/fluentd/pull/1718
* in_tail: Add pos_file duplication check
  https://github.com/fluent/fluentd/pull/1720

### Bug fixes

* parser_apache2: Delay time parser initialization
  https://github.com/fluent/fluentd/pull/1690
* cert_option: Improve generated certificates' conformance to X.509 specification
  https://github.com/fluent/fluentd/pull/1714
* buffer: Always lock chunks first to avoid deadlock
  https://github.com/fluent/fluentd/pull/1721

## Release v0.14.21 - 2017/09/07

### New features / Enhancements

* filter_parser: Support record_accessor in key_name
  https://github.com/fluent/fluentd/pull/1654
* buffer: Support record_accessor in chunk keys
  https://github.com/fluent/fluentd/pull/1662

### Bug fixes

* compat_parameters: Support all syslog parser parameters
  https://github.com/fluent/fluentd/pull/1650
* filter_record_transformer: Don't create new keys if the original record doesn't have `keep_keys` keys
  https://github.com/fluent/fluentd/pull/1663
* in_tail: Fix the error when 'tag *' is configured
  https://github.com/fluent/fluentd/pull/1664
* supervisor: Clear previous worker pids when receive kill signals.
  https://github.com/fluent/fluentd/pull/1683

## Release v0.14.20 - 2017/07/31

### New features / Enhancements

* plugin: Add record_accessor plugin helper
  https://github.com/fluent/fluentd/pull/1637
* log: Add format and time_format parameters to `<system>` setting
  https://github.com/fluent/fluentd/pull/1644

### Bug fixes

* buf_file: Improve file handling to mitigate broken meta file
  https://github.com/fluent/fluentd/pull/1628
* in_syslog: Fix the description of resolve_hostname parameter
  https://github.com/fluent/fluentd/pull/1633
* process: Fix signal handling. Send signal to all workers
  https://github.com/fluent/fluentd/pull/1642
* output: Fix error message typo
  https://github.com/fluent/fluentd/pull/1643

## Release v0.14.19 - 2017/07/12

### New features / Enhancements

* in_syslog: More characters are available in tag part of syslog format
  https://github.com/fluent/fluentd/pull/1610
* in_syslog: Add resolve_hostname parameter
  https://github.com/fluent/fluentd/pull/1616
* filter_grep: Support new configuration format by config_section
  https://github.com/fluent/fluentd/pull/1611

### Bug fixes

* output: Fix race condition of retry state in flush thread
  https://github.com/fluent/fluentd/pull/1623
* test: Fix typo in test_in_tail.rb
  https://github.com/fluent/fluentd/pull/1622

## Release v0.14.18 - 2017/06/21

### New features / Enhancements

* parser: Add rfc5424 regex without priority
  https://github.com/fluent/fluentd/pull/1600

### Bug fixes

* in_tail: Fix timing issue that the excluded_path doesn't apply.
  https://github.com/fluent/fluentd/pull/1597
* config: Fix broken UTF-8 encoded configuration file handling
  https://github.com/fluent/fluentd/pull/1592
* out_forward: Don't stop heartbeat when error happen
  https://github.com/fluent/fluentd/pull/1602
* Fix command name typo in plugin template
  https://github.com/fluent/fluentd/pull/1603

## Release v0.14.17 - 2017/05/29

### New features / Enhancements

* in_tail: Add ignore_repeated_permission_error
  https://github.com/fluent/fluentd/pull/1574
* server: Accept private key for TLS server without passphrase
  https://github.com/fluent/fluentd/pull/1575
* config: Validate workers option on standalone mode
  https://github.com/fluent/fluentd/pull/1577

### Bug fixes

* config: Mask all secret parameters in worker section
  https://github.com/fluent/fluentd/pull/1580
* out_forward: Fix ack handling
  https://github.com/fluent/fluentd/pull/1581
* plugin-config-format: Fix markdown format generator
  https://github.com/fluent/fluentd/pull/1585

## Release v0.14.16 - 2017/05/13

### New features / Enhancements

* config: Allow null byte in double-quoted string
  https://github.com/fluent/fluentd/pull/1552
* parser: Support %iso8601 special case for time_format
  https://github.com/fluent/fluentd/pull/1562

### Bug fixes

* out_forward: Call proper method for each connection type
  https://github.com/fluent/fluentd/pull/1560
* in_monitor_agent: check variable buffer is a Buffer instance
  https://github.com/fluent/fluentd/pull/1556
* log: Add missing '<<' method to delegators
  https://github.com/fluent/fluentd/pull/1558
* command: uninitialized constant Fluent::Engine in fluent-binlog-reader
  https://github.com/fluent/fluentd/pull/1568

## Release v0.14.15 - 2017/04/23

### New features / Enhancements

* Add `<worker N>` directive
  https://github.com/fluent/fluentd/pull/1507
* in_tail: Do not warn that directories are unreadable in the in_tail plugin
  https://github.com/fluent/fluentd/pull/1540
* output: Add formatted_to_msgpack_binary? to Output plugin API
  https://github.com/fluent/fluentd/pull/1547
* windows: Allow the Windows Service name Fluentd runs as to be configurable
  https://github.com/fluent/fluentd/pull/1548

### Bug fixes

* in_http: Fix X-Forwarded-For header handling. Accept multiple headers
  https://github.com/fluent/fluentd/pull/1535
* Fix backward compatibility with Fluent::DetachProcess and Fluent::DetachMultiProcess
  https://github.com/fluent/fluentd/pull/1522
* fix typo
  https://github.com/fluent/fluentd/pull/1521
  https://github.com/fluent/fluentd/pull/1523
  https://github.com/fluent/fluentd/pull/1544
* test: Fix out_file test with timezone
  https://github.com/fluent/fluentd/pull/1546
* windows: Quote the file path to the Ruby bin directory when starting fluentd as a windows service
  https://github.com/fluent/fluentd/pull/1536

## Release v0.14.14 - 2017/03/23

### New features / Enhancements

* in_http: Support 'application/msgpack` header
  https://github.com/fluent/fluentd/pull/1498
* in_udp: Add message_length_limit parameter for parameter name consistency with in_syslog
  https://github.com/fluent/fluentd/pull/1515
* in_monitor_agent: Start one HTTP server per worker on sequential port numbers
  https://github.com/fluent/fluentd/pull/1493
* in_tail: Skip the refresh of watching list on startup
  https://github.com/fluent/fluentd/pull/1487
* filter_parser: filter_parser: Add emit_invalid_record_to_error parameter
  https://github.com/fluent/fluentd/pull/1494
* parser_syslog: Support RFC5424 syslog format
  https://github.com/fluent/fluentd/pull/1492
* parser: Allow escape sequence in Apache access log
  https://github.com/fluent/fluentd/pull/1479
* config: Add actual value in the placeholder error message
  https://github.com/fluent/fluentd/pull/1497
* log: Add Fluent::Log#<< to support some SDKs
  https://github.com/fluent/fluentd/pull/1478

### Bug fixes

* Fix cleanup resource
  https://github.com/fluent/fluentd/pull/1483
* config: Set encoding forcefully to avoid UndefinedConversionError
  https://github.com/fluent/fluentd/pull/1477
* Fix Input and Output deadlock when buffer is full during startup
  https://github.com/fluent/fluentd/pull/1502
* config: Fix log_level handling in `<system>`
  https://github.com/fluent/fluentd/pull/1501
* Fix typo in root agent error log
  https://github.com/fluent/fluentd/pull/1491
* storage: Fix a bug storage_create cannot accept hash as `conf` keyword argument
  https://github.com/fluent/fluentd/pull/1482

## Release v0.14.13 - 2017/02/17

### New features / Enhancements

* in_tail: Add 'limit_recently_modified' to limit watch files.
  https://github.com/fluent/fluentd/pull/1474
* configuration: Improve 'flush_interval' handling for better message and backward compatibility
  https://github.com/fluent/fluentd/pull/1442
* command: Add 'fluent-plugin-generate' command
  https://github.com/fluent/fluentd/pull/1427
* output: Skip record when 'Output#format' returns nil
  https://github.com/fluent/fluentd/pull/1469

### Bug fixes

* output: Secondary calculation should consider 'retry_max_times'
  https://github.com/fluent/fluentd/pull/1452
* Fix regression of deprecated 'process' module
  https://github.com/fluent/fluentd/pull/1443
* Fix missing parser_regex require
  https://github.com/fluent/fluentd/issues/1458
  https://github.com/fluent/fluentd/pull/1453
* Keep 'Fluent::BufferQueueLimitError' for existing plugins
  https://github.com/fluent/fluentd/pull/1456
* in_tail: Untracked files should be removed from watching list to avoid memory bloat
  https://github.com/fluent/fluentd/pull/1467
* in_tail: directories should be skipped when the ** pattern is used
  https://github.com/fluent/fluentd/pull/1464
* record_transformer: Revert "Use BasicObject for cleanroom" for `enable_ruby` regression.
  https://github.com/fluent/fluentd/pull/1461
* buf_file: handle "Too many open files" error to keep buffer and metadata pair
  https://github.com/fluent/fluentd/pull/1468

## Release v0.14.12 - 2017/01/30

### New features / Enhancements
* Support multi process workers by `workers` option
  https://github.com/fluent/fluentd/pull/1386
* Support TLS transport security layer by server plugin helper, and forward input/output plugins
  https://github.com/fluent/fluentd/pull/1423
* Update internal log event handling to route log events to `@FLUENT_LOG` label if configured, suppress log events in startup/shutdown in default
  https://github.com/fluent/fluentd/pull/1405
* Rename buffer plugin chunk limit parameters for consistency
  https://github.com/fluent/fluentd/pull/1412
* Encode string values from configuration files in UTF8
  https://github.com/fluent/fluentd/pull/1411
* Reorder plugin load paths to load rubygem plugins earlier than built-in plugins to overwrite them
  https://github.com/fluent/fluentd/pull/1410
* Clock API to control internal thread control
  https://github.com/fluent/fluentd/pull/1425
* Validate `config_param` options to restrict unexpected specifications
  https://github.com/fluent/fluentd/pull/1437
* formatter: Add `add_newline` option to get formatted lines without newlines
  https://github.com/fluent/fluentd/pull/1420
* in_forward: Add `ignore_network_errors_at_startup` option for automated cluster deployment
  https://github.com/fluent/fluentd/pull/1399
* in_forward: Close listening socket in #stop, not to accept new connection request in early stage of shutdown
  https://github.com/fluent/fluentd/pull/1401
* out_forward: Ensure to pack values in `str` type of msgpack
  https://github.com/fluent/fluentd/pull/1413
* in_tail: Add `emit_unmatched_lines` to capture lines which unmatch configured regular expressions
  https://github.com/fluent/fluentd/pull/1421
* in_tail: Add `open_on_every_update` to read lines from files opened in exclusive mode on Windows platform
  https://github.com/fluent/fluentd/pull/1409
* in_monitor_agent: Add `with_ivars` query parameter to get instance variables only for specified instance variables
  https://github.com/fluent/fluentd/pull/1393
* storage_local: Generate file store path using `usage`, with `root_dir` configuration
  https://github.com/fluent/fluentd/pull/1438
* Improve test stability
  https://github.com/fluent/fluentd/pull/1426

### Bug fixes
* Fix bug to ignore command line options: `--rpc-endpoint`, `--suppress-config-dump`, etc
  https://github.com/fluent/fluentd/pull/1398
* Fix bug to block infinitely in shutdown when buffer is full and `overflow_action` is `block`
  https://github.com/fluent/fluentd/pull/1396
* buf_file: Fix bug not to use `root_dir` even if configured correctly
  https://github.com/fluent/fluentd/pull/1417
* filter_record_transformer: Fix to use BasicObject for clean room
  https://github.com/fluent/fluentd/pull/1415
* filter_record_transformer: Fix bug that `remove_keys` doesn't work with `renew_time_key`
  https://github.com/fluent/fluentd/pull/1433
* in_monitor_agent: Fix bug to crash with NoMethodError for some output plugins
  https://github.com/fluent/fluentd/pull/1365

## Release v0.14.11 - 2016/12/26

### New features / Enhancements
* Add "root_dir" parameter in `<system>` directive to configure server root directory, used for buffer/storage paths
  https://github.com/fluent/fluentd/pull/1374
* Fix not to restart Fluentd processes when unrecoverable errors occur
  https://github.com/fluent/fluentd/pull/1359
* Show warnings in log when output flush operation takes longer time than threshold
  https://github.com/fluent/fluentd/pull/1370
* formatter_csv: Raise configuration error when no field names are specified
  https://github.com/fluent/fluentd/pull/1369
* in_syslog: Update implementation to use plugin helpers
  https://github.com/fluent/fluentd/pull/1382
* in_forward: Add a configuration parameter "source_address_key"
  https://github.com/fluent/fluentd/pull/1382
* in_monitor_agent: Add a parameter "include_retry" to get detail retry status
  https://github.com/fluent/fluentd/pull/1387
* Add Ruby 2.4 into supported ruby versions

### Bug fixes
* Fix to set process name of supervisor process
  https://github.com/fluent/fluentd/pull/1380
* in_forward: Fix a bug not to handle "require_ack_response" correctly
  https://github.com/fluent/fluentd/pull/1389


## Release v0.14.10 - 2016/12/14

### New features / Enhancement

* Add socket/server plugin helper to write TCP/UDP clients/servers as Fluentd plugin
  https://github.com/fluent/fluentd/pull/1312
  https://github.com/fluent/fluentd/pull/1350
  https://github.com/fluent/fluentd/pull/1356
  https://github.com/fluent/fluentd/pull/1362
* Fix to raise errors when injected hostname is also specified as chunk key
  https://github.com/fluent/fluentd/pull/1357
* in_tail: Optimize to read lines from file
  https://github.com/fluent/fluentd/pull/1325
* in_monitor_agent: Add new parameter "include_config"(default: true)
  https://github.com/fluent/fluentd/pull/1317
* in_syslog: Add "priority_key" and "facility_key" options
  https://github.com/fluent/fluentd/pull/1351
* filter_record_transformer: Remove obsoleted syntax like "${message}" and not to dump records in logs
  https://github.com/fluent/fluentd/pull/1328
* Add an option "--time-as-integer" to fluent-cat command to send events from v0.14 fluent-cat to v0.12 fluentd
  https://github.com/fluent/fluentd/pull/1349

### Bug fixes

* Specify correct Oj options for newer versions (Oj 2.18.0 or later)
  https://github.com/fluent/fluentd/pull/1331
* TimeSlice output plugins (in v0.12 style) raise errors when "utc" parameter is specified
  https://github.com/fluent/fluentd/pull/1319
* Parser plugins cannot use options for regular expressions
  https://github.com/fluent/fluentd/pull/1326
* Fix bugs not to raise errors to use logger in v0.12 plugins
  https://github.com/fluent/fluentd/pull/1344
  https://github.com/fluent/fluentd/pull/1332
* Fix bug about shutting down Fluentd in Windows
  https://github.com/fluent/fluentd/pull/1367
* in_tail: Close files explicitly in tests
  https://github.com/fluent/fluentd/pull/1327
* out_forward: Fix bug not to convert buffer configurations into v0.14 parameters
  https://github.com/fluent/fluentd/pull/1337
* out_forward: Fix bug to raise error when "expire_dns_cache" is specified
  https://github.com/fluent/fluentd/pull/1346
* out_file: Fix bug to raise error about buffer chunking when it's configured as secondary
  https://github.com/fluent/fluentd/pull/1338

## Release v0.14.9 - 2016/11/15

### New features / Enhancement

* filter_parser: Port fluent-plugin-parser into built-in plugin
  https://github.com/fluent/fluentd/pull/1191
* parser/formatter plugin helpers with default @type in plugin side
  https://github.com/fluent/fluentd/pull/1267
* parser: Reconstruct Parser related classes
  https://github.com/fluent/fluentd/pull/1286
* filter_record_transformer: Remove old behaviours
  https://github.com/fluent/fluentd/pull/1311
* Migrate some built-in plugins into v0.14 API
  https://github.com/fluent/fluentd/pull/1257 (out_file)
  https://github.com/fluent/fluentd/pull/1297 (out_exec, out_exec_filter)
  https://github.com/fluent/fluentd/pull/1306 (in_forward, out_forward)
  https://github.com/fluent/fluentd/pull/1308 (in_http)
* test: Improve test drivers
  https://github.com/fluent/fluentd/pull/1302
  https://github.com/fluent/fluentd/pull/1305

### Bug fixes

* log: Avoid name conflict between Fluent::Logger
  https://github.com/fluent/fluentd/pull/1274
* fluent-cat: Fix fluent-cat command to send sub-second precision time
  https://github.com/fluent/fluentd/pull/1277
* config: Fix a bug not to overwrite default value with nil
  https://github.com/fluent/fluentd/pull/1296
* output: Fix timezone for compat timesliced output plugins
  https://github.com/fluent/fluentd/pull/1307
* out_forward: fix not to raise error when out_forward is initialized as secondary
  https://github.com/fluent/fluentd/pull/1313
* output: Event router for secondary output
  https://github.com/fluent/fluentd/pull/1283
* test: fix to return the block value as expected by many rubyists
  https://github.com/fluent/fluentd/pull/1284

## Release v0.14.8 - 2016/10/13

### Bug fixes

* Add msgpack_each to buffer chunks in compat-layer output plugins
  https://github.com/fluent/fluentd/pull/1273

## Release v0.14.7 - 2016/10/07

### New features / Enhancement

* Support data compression in buffer plugins
  https://github.com/fluent/fluentd/pull/1172
* in_forward: support to transfer compressed data
  https://github.com/fluent/fluentd/pull/1179
* out_stdout: fix to show nanosecond resolution time
  https://github.com/fluent/fluentd/pull/1249
* Add option to rotate Fluentd daemon's log
  https://github.com/fluent/fluentd/pull/1235
* Add extract plugin helper, with symmetric time parameter support in parser/formatter and inject/extract
  https://github.com/fluent/fluentd/pull/1207
* Add a feature to parse/format numeric time (unix time [+ subsecond value])
  https://github.com/fluent/fluentd/pull/1254
* Raise configuration errors for inconsistent `<label>` configurations
  https://github.com/fluent/fluentd/pull/1233
* Fix to instantiate an unconfigured section even for multi: true
  https://github.com/fluent/fluentd/pull/1210
* Add validators of placeholders for buffering key extraction
  https://github.com/fluent/fluentd/pull/1255
* Fix to show log messages about filter optimization only when needed
  https://github.com/fluent/fluentd/pull/1227
* Add some features to write plugins more easily
  https://github.com/fluent/fluentd/pull/1256
* Add a tool to load dumped events from file
  https://github.com/fluent/fluentd/pull/1165

### Bug fixes

* Fix Oj's default option to encode/decode JSON in the same way with Yajl
  https://github.com/fluent/fluentd/pull/1147
  https://github.com/fluent/fluentd/pull/1239
* Fix to raise correct configuration errors
  https://github.com/fluent/fluentd/pull/1223
* Fix a bug to call `shutdown` method (and some others) twice
  https://github.com/fluent/fluentd/pull/1242
* Fix to enable `chunk.each` only when it's encoded by msgpack
  https://github.com/fluent/fluentd/pull/1263
* Fix a bug not to stop enqueue/flush threads correctly
  https://github.com/fluent/fluentd/pull/1264
* out_forward: fix a bug that UDP heartbeat doesn't work
  https://github.com/fluent/fluentd/pull/1238
* out_file: fix a crash bug when v0.14 enables symlink and resumes existing buffer file chunk generated by v0.12
  https://github.com/fluent/fluentd/pull/1234
* in_monitor_agent: fix compatibility problem between outputs of v0.12 and v0.14
  https://github.com/fluent/fluentd/pull/1232
* in_tail: fix a bug to crash to read large amount logs
  https://github.com/fluent/fluentd/pull/1259
  https://github.com/fluent/fluentd/pull/1261

## Release v0.14.6 - 2016/09/07

### Bug fixes

* in_tail: Add a missing parser_multiline require
  https://github.com/fluent/fluentd/pull/1212
* forward: Mark secret parameters of forward plugins as secret
  https://github.com/fluent/fluentd/pull/1209

## Release v0.14.5 - 2016/09/06

### New features / Enhancement

* Add authentication / authorization feature to forward protocol and in/out_forward plugins
  https://github.com/fluent/fluentd/pull/1136
* Add a new plugin to dump buffers in retries as secondary plugin
  https://github.com/fluent/fluentd/pull/1154
* Merge out_buffered_stdout and out_buffered_null into out_stdout and out_null
  https://github.com/fluent/fluentd/pull/1200

### Bug fixes

* Raise configuration errors to clarify what's wrong when "@type" is missing
  https://github.com/fluent/fluentd/pull/1202
* Fix the bug not to launch Fluentd when v0.12 MultiOutput plugin is configured
  https://github.com/fluent/fluentd/pull/1206

## Release v0.14.4 - 2016/08/31

### New features / Enhancement

* Add a method to Filter API to update time of events
  https://github.com/fluent/fluentd/pull/1140
* Improve performance of filter pipeline
  https://github.com/fluent/fluentd/pull/1145
* Fix to suppress not to warn about different plugins for primary and secondary without any problems
  https://github.com/fluent/fluentd/pull/1153
* Add deprecated/obsoleted options to config_param to show removed/warned parameters
  https://github.com/fluent/fluentd/pull/1186
* in_forward: Add a feature source_hostname_key to inject source hostname into records
  https://github.com/fluent/fluentd/pull/807
* in_tail: Add a feature from_encoding to specify both encoding from and to
  https://github.com/fluent/fluentd/pull/1067
* filter_record_transformer: Fix to prevent overwriting reserved placeholder keys
  https://github.com/fluent/fluentd/pull/1176
* Migrate some built-in plugins into v0.14 API
  https://github.com/fluent/fluentd/pull/1149
  https://github.com/fluent/fluentd/pull/1151
* Update dependencies
  https://github.com/fluent/fluentd/pull/1193

### Bug fixes

* Fix to start/stop/restart Fluentd processes correctly on Windows environment
  https://github.com/fluent/fluentd/pull/1171
  https://github.com/fluent/fluentd/pull/1192
* Fix to handle Windows events correctly in winsvc.rb
  https://github.com/fluent/fluentd/pull/1155
  https://github.com/fluent/fluentd/pull/1170
* Fix not to continue to restart workers for configuration errors
  https://github.com/fluent/fluentd/pull/1183
* Fix output threads to start enqueue/flush buffers until plugins' start method ends
  https://github.com/fluent/fluentd/pull/1190
* Fix a bug not to set umask 0
  https://github.com/fluent/fluentd/pull/1152
* Fix resource leak on one-shot timers
  https://github.com/fluent/fluentd/pull/1178
* Fix to call plugin helper methods in configure
  https://github.com/fluent/fluentd/pull/1184
* Fix a bug to count event size
  https://github.com/fluent/fluentd/pull/1164/files
* Fix to require missed compat modules
  https://github.com/fluent/fluentd/pull/1168
* Fix to start properly for plugins under MultiOutput
  https://github.com/fluent/fluentd/pull/1167
* Fix test drivers to set class name into plugin instances
  https://github.com/fluent/fluentd/pull/1069
* Fix tests not to use mocks for Time (improve test stabilization)
  https://github.com/fluent/fluentd/pull/1194

## Release 0.14.3 - 2016/08/30

* Fix the dependency for ServerEngine 1.x

## Release 0.14.2 - 2016/08/09

### New features / Enhancement

* Fix to split large event stream into some/many chunks in buffers
  https://github.com/fluent/fluentd/pull/1062
* Add parser and filter support in compat_parameters plugin helper
  https://github.com/fluent/fluentd/pull/1079
* Add a RPC call to flush buffers and stop workers
  https://github.com/fluent/fluentd/pull/1134
* Update forward protocol to pass the number of events in a payload
  https://github.com/fluent/fluentd/pull/1137
* Improve performance of some built-in formatter plugins
  https://github.com/fluent/fluentd/pull/1082
  https://github.com/fluent/fluentd/pull/1086
* Migrate some built-in plugins and plugin util modules into v0.14 API
  https://github.com/fluent/fluentd/pull/1058
  https://github.com/fluent/fluentd/pull/1061
  https://github.com/fluent/fluentd/pull/1076
  https://github.com/fluent/fluentd/pull/1078
  https://github.com/fluent/fluentd/pull/1081
  https://github.com/fluent/fluentd/pull/1083
  https://github.com/fluent/fluentd/pull/1091
* Register RegExpParser as a parser plugin explicitly
  https://github.com/fluent/fluentd/pull/1094
* Add delimiter option to CSV parser
  https://github.com/fluent/fluentd/pull/1108
* Add an option to receive longer udp syslog messages
  https://github.com/fluent/fluentd/pull/1127
* Add a option to suspend internal status in dummy plugin
  https://github.com/fluent/fluentd/pull/900
* Add a feature to capture filtered records in test driver for Filter plugins
  https://github.com/fluent/fluentd/pull/1077
* Add some utility methods to plugin test drivers
  https://github.com/fluent/fluentd/pull/1114

### Bug fixes

* Fix bug to read non buffer-chunk files as buffer chunks when Fluentd resumed
  https://github.com/fluent/fluentd/pull/1124
* Fix bug not to load Filter plugins which are specified in configurations
  https://github.com/fluent/fluentd/pull/1118
* Fix bug to ignore `-p` option to specify directories of plugins
  https://github.com/fluent/fluentd/pull/1133
* Fix bug to overwrite base class configuration section definitions by subclasses
  https://github.com/fluent/fluentd/pull/1119
* Fix to stop Fluentd worker process by Ctrl-C when --no-supervisor specified
  https://github.com/fluent/fluentd/pull/1089
* Fix regression about RPC call to reload configuration
  https://github.com/fluent/fluentd/pull/1093
* Specify to ensure Oj JSON parser to use strict mode
  https://github.com/fluent/fluentd/pull/1147
* Fix unexisting path handling in Windows environment
  https://github.com/fluent/fluentd/pull/1104

## Release 0.14.1 - 2016/06/30

### New features / Enhancement

* Add plugin helpers for parsers and formatters
  https://github.com/fluent/fluentd/pull/1023
* Extract some mixins into compat modules
  https://github.com/fluent/fluentd/pull/1044
  https://github.com/fluent/fluentd/pull/1052
* Add utility methods for tests and test drivers
  https://github.com/fluent/fluentd/pull/1047
* Migrate some built-in plugins to v0.14 APIs
  https://github.com/fluent/fluentd/pull/1049
  https://github.com/fluent/fluentd/pull/1057
  https://github.com/fluent/fluentd/pull/1060
  https://github.com/fluent/fluentd/pull/1064
* Add support of X-Forwarded-For header in in_http plugin
  https://github.com/fluent/fluentd/pull/1051
* Warn not to create too many staged chunks at configure
  https://github.com/fluent/fluentd/pull/1054
* Add a plugin helper to inject tag/time/hostname
  https://github.com/fluent/fluentd/pull/1063

### Bug fixes

* Fix in_monitor_agent for v0.14 plugins
  https://github.com/fluent/fluentd/pull/1003
* Fix to call #format_stream of plugins themselves when RecordFilter mixin included
  https://github.com/fluent/fluentd/pull/1005
* Fix shutdown sequence to wait force flush
  https://github.com/fluent/fluentd/pull/1009
* Fix a deadlock bug in shutdown
  https://github.com/fluent/fluentd/pull/1010
* Fix to require DetachProcessMixin in default for compat plugins
  https://github.com/fluent/fluentd/pull/1014
* Fix to overwrite configure_proxy name only for root sections for debugging
  https://github.com/fluent/fluentd/pull/1015
* Rename file for in_unix plugin
  https://github.com/fluent/fluentd/pull/1017
* Fix a bug not to create pid file when daemonized
  https://github.com/fluent/fluentd/pull/1021
* Fix wrong DEFAULT_PLUGIN_PATH
  https://github.com/fluent/fluentd/pull/1028
* Fix a bug not to use primary plugin type for secondary in default
  https://github.com/fluent/fluentd/pull/1032
* Add --run-worker option to distinguish to run as worker without supervisor
  https://github.com/fluent/fluentd/pull/1033
* Fix regression of fluent-debug command
  https://github.com/fluent/fluentd/pull/1046
* Update windows-pr dependency to 1.2.5
  https://github.com/fluent/fluentd/pull/1065
* Fix supervisor to pass RUBYOPT to worker processes
  https://github.com/fluent/fluentd/pull/1066

## Release 0.14.0 - 2016/05/25

### New features / Enhancement

This list includes changes of 0.14.0.pre.1 and release candidates.

* Update supported Ruby version to 2.1 or later
  https://github.com/fluent/fluentd/pull/692
* Sub-second event time support
  https://github.com/fluent/fluentd/pull/653
* Windows support and supervisor improvement
  https://github.com/fluent/fluentd/pull/674
  https://github.com/fluent/fluentd/pull/831
  https://github.com/fluent/fluentd/pull/880
* Add New plugin API
  https://github.com/fluent/fluentd/pull/800
  https://github.com/fluent/fluentd/pull/843
  https://github.com/fluent/fluentd/pull/866
  https://github.com/fluent/fluentd/pull/905
  https://github.com/fluent/fluentd/pull/906
  https://github.com/fluent/fluentd/pull/917
  https://github.com/fluent/fluentd/pull/928
  https://github.com/fluent/fluentd/pull/943
  https://github.com/fluent/fluentd/pull/964
  https://github.com/fluent/fluentd/pull/965
  https://github.com/fluent/fluentd/pull/972
  https://github.com/fluent/fluentd/pull/983
* Add standard chunking format
  https://github.com/fluent/fluentd/pull/914
* Add Compatibility layer for v0.12 plugins
  https://github.com/fluent/fluentd/pull/912
  https://github.com/fluent/fluentd/pull/969
  https://github.com/fluent/fluentd/pull/974
  https://github.com/fluent/fluentd/pull/992
  https://github.com/fluent/fluentd/pull/999
* Add Plugin Storage API
  https://github.com/fluent/fluentd/pull/864
  https://github.com/fluent/fluentd/pull/910
* Enforce to use router.emit instead of Engine.emit
  https://github.com/fluent/fluentd/pull/883
* log: Show plugin name and id in logs
  https://github.com/fluent/fluentd/pull/860
* log: Dump configurations with v1 syntax in logs
  https://github.com/fluent/fluentd/pull/867
* log: Dump errors with class in logs
  https://github.com/fluent/fluentd/pull/899
* config: Add simplified syntax for configuration values of hash and array
  https://github.com/fluent/fluentd/pull/875
* config: Add 'init' option to config_section to initialize section objects
  https://github.com/fluent/fluentd/pull/877
* config: Support multiline string in quoted strings
  https://github.com/fluent/fluentd/pull/929
* config: Add optional arguments on Element#elements to select child elements
  https://github.com/fluent/fluentd/pull/948
* config: Show deprecated warnings for reserved parameters
  https://github.com/fluent/fluentd/pull/971
* config: Make the detach process forward interval configurable
  https://github.com/fluent/fluentd/pull/982
* in_tail: Add 'path_key' option to inject tailing path
  https://github.com/fluent/fluentd/pull/951
* Remove in_status plugin
  https://github.com/fluent/fluentd/pull/690

### Bug fixes

* config: Enum list must be of symbols
  https://github.com/fluent/fluentd/pull/821
* config: Fix to dup values in default
  https://github.com/fluent/fluentd/pull/827
* config: Fix problems about overwriting subsections
  https://github.com/fluent/fluentd/pull/844
  https://github.com/fluent/fluentd/pull/981
* log: Serialize Fluent::EventTime as Integer in JSON
  https://github.com/fluent/fluentd/pull/904
* out_forward: Add missing error class and tests for it
  https://github.com/fluent/fluentd/pull/922

### Internal fix / Refactoring

* Fix dependencies between files
  https://github.com/fluent/fluentd/pull/799
  https://github.com/fluent/fluentd/pull/808
  https://github.com/fluent/fluentd/pull/823
  https://github.com/fluent/fluentd/pull/824
  https://github.com/fluent/fluentd/pull/825
  https://github.com/fluent/fluentd/pull/826
  https://github.com/fluent/fluentd/pull/828
  https://github.com/fluent/fluentd/pull/859
  https://github.com/fluent/fluentd/pull/892
* Separate PluginId from config
  https://github.com/fluent/fluentd/pull/832
* Separate MessagePack factory from Engine
  https://github.com/fluent/fluentd/pull/871
* Register plugins to registry
  https://github.com/fluent/fluentd/pull/838
* Move TypeConverter mixin to mixin.rb
  https://github.com/fluent/fluentd/pull/842
* Override default configurations by `<system>`
  https://github.com/fluent/fluentd/pull/854
* Suppress Ruby level warnings
  https://github.com/fluent/fluentd/pull/846
  https://github.com/fluent/fluentd/pull/852
  https://github.com/fluent/fluentd/pull/890
  https://github.com/fluent/fluentd/pull/946
  https://github.com/fluent/fluentd/pull/955
  https://github.com/fluent/fluentd/pull/966

See https://github.com/fluent/fluentd/blob/v0.12/CHANGELOG.md for v0.12 changelog
