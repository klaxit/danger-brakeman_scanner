# Danger Brakeman Plugin [![CircleCI](https://circleci.com/gh/klaxit/danger-brakeman_scanner.svg?style=shield)](https://circleci.com/gh/klaxit/danger-brakeman_scanner) [![Gem Version](https://badge.fury.io/rb/danger-brakeman_scanner.svg)](https://badge.fury.io/rb/danger-brakeman_scanner)

A [Danger] plugin for [Brakeman] security static analysis.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "danger-brakeman_scanner"
```

## Usage

Run Ruby files through Brakeman. A markdown table will be shown as result.

```ruby
brakeman.run("my_app_path")
```

You can pass a list of options as well, thoses will be given as-is to brakeman
scanner.

```ruby
brakeman.run(app_path: "my_app_path", github_repo: "klaxit/fast-polylines")
```

The list of all options is available below, but not that some of those won't make sense here:

<details>
<summary>
https://github.com/presidentbeef/brakeman/blob/1eef0997f2a8a01f885d3f4908447ab20bfd0b7d/lib/brakeman.rb#L32-L67
</summary>

- `:app_path` - path to root of Rails app (required)
- `:additional_checks_path` - array of additional directories containing additional out-of-tree checks to run
- `:additional_libs_path` - array of additional application relative lib directories (ex. app/mailers) to process
- `:assume_all_routes` - assume all methods are routes (default: true)
- `:check_arguments` - check arguments of methods (default: true)
- `:collapse_mass_assignment` - report unprotected models in single warning (default: false)
- `:combine_locations` - combine warning locations (default: true)
- `:config_file` - configuration file
- `:escape_html` - escape HTML by default (automatic)
- `:exit_on_error` - only affects Commandline module (default: true)
- `:exit_on_warn` - only affects Commandline module (default: true)
- `:github_repo` - github repo to use for file links (user/repo[/path][@ref])
- `:highlight_user_input` - highlight user input in reported warnings (default: true)
- `:html_style` - path to CSS file
- `:ignore_model_output` - consider models safe (default: false)
- `:index_libs` - add libraries to call index (default: true)
- `:interprocedural` - limited interprocedural processing of method calls (default: false)
- `:message_limit` - limit length of messages
- `:min_confidence` - minimum confidence (0-2, 0 is highest)
- `:output_files` - files for output
- `:output_formats` - formats for output (:to_s, :to_tabs, :to_csv, :to_html)
- `:parallel_checks` - run checks in parallel (default: true)
- `:parser_timeout` - set timeout for parsing an individual file (default: 10 seconds)
- `:print_report` - if no output file specified, print to stdout (default: false)
- `:quiet` - suppress most messages (default: true)
- `:rails3` - force Rails 3 mode (automatic)
- `:rails4` - force Rails 4 mode (automatic)
- `:rails5` - force Rails 5 mode (automatic)
- `:rails6` - force Rails 6 mode (automatic)
- `:report_routes` - show found routes on controllers (default: false)
- `:run_checks` - array of checks to run (run all if not specified)
- `:safe_methods` - array of methods to consider safe
- `:skip_libs` - do not process lib/ directory (default: false)
- `:skip_checks` - checks not to run (run all if not specified)
- `:absolute_paths` - show absolute path of each file (default: false)
- `:summary_only` - only output summary section of report for plain/table (:summary_only, :no_summary, true)

</details>

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `make` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/klaxit/danger-brakeman_scanner. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct].


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Danger::Brakeman project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct].

[code of conduct]: https://github.com/klaxit/danger-brakeman_scanner/blob/master/CODE_OF_CONDUCT.md
[brakeman]: https://brakemanscanner.org/
[danger]: https://danger.systems/ruby/
