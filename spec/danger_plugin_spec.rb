# frozen_string_literal: true

RSpec.describe Danger::DangerBrakeman do
  it "should be a plugin" do
    expect(Danger::DangerBrakemanScanner.new(nil)).to be_a Danger::Plugin
    expect(Danger::DangerBrakeman.new(nil)).to be_a Danger::Plugin
  end

  #
  # You should test your custom attributes and methods here
  #
  describe "with Dangerfile" do
    before do
      @dangerfile = testing_dangerfile
      @plugin = [@dangerfile.brakeman, @dangerfile.brakeman_scanner].sample
    end

    it "should print report and fail for dangerous apps" do
      @plugin.run(File.expand_path("fixtures/dangerous_rails_app", __dir__))
      errors = @dangerfile.status_report[:errors]
      expect(errors.length).to be 1
      expect(errors.first).to match /^Brakeman static analysis detected issues in the code/
      markdowns = @dangerfile.status_report[:markdowns]
      expect(markdowns.length).to be 1
      expect(markdowns.first.message).to match /Possible SQL injection near line 5:/
    end

    it "should do nothing for safe apps" do
      @plugin.run(File.expand_path("fixtures/safe_rails_app", __dir__))
      expect(@dangerfile.status_report[:errors]).to be_empty
      expect(@dangerfile.status_report[:markdowns]).to be_empty
    end
  end
end
