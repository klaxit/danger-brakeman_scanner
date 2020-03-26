# frozen_string_literal: true

# Run ruby files through Brakeman
#
# @example Run with default configuration in application directory
#
#   brakeman.run
#
# @see https://github.com/presidentbeef/brakeman
# @tags brakeman, security, ruby
class Danger::DangerBrakeman < Danger::Plugin
  require "brakeman"

  # Run a Brakeman scan over current application.
  #
  # @param options (see {Brakeman.run})
  # @return [void]
  def run(options = File.dirname(Kernel.caller_locations.first.absolute_path))
    tracker = Brakeman.run(options)
    return if tracker.warnings.empty? && tracker.errors.empty?

    markdown tracker.report.to_markdown
    failure "Brakeman static analysis detected issues in the code. " \
            "If this is a false positive, [mark it as such]" \
            "(https://brakemanscanner.org/docs/ignoring_false_positives/)."
  end
end
