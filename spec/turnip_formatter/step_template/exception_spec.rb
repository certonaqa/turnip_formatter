require 'spec_helper'
require 'turnip_formatter/step_template/exception'

describe TurnipFormatter::StepTemplate::Exception do
  after do
    TurnipFormatter.step_templates.pop
  end

  let!(:template) do
    described_class.new
  end

  describe '#build_failed' do
    subject { JSON.parse(template.build_failed(failed_example)) }

    it do
      expect(subject["message"]).to_not be_nil
      expect(subject["backtrace"]).to eq ["./spec/support/example_helper.rb:7:in `block in failed_example'", "/path/to/hoge.feature:10:in `base_example'", "./spec/support/example_helper.rb:30:in `instance_eval'", "./spec/support/example_helper.rb:30:in `base_example'",                                                     "./spec/support/example_helper.rb:7:in `failed_example'", "./spec/turnip_formatter/step_template/exception_spec.rb:14:in `block (3 levels) in <top (required)>'"      , "./spec/turnip_formatter/step_template/exception_spec.rb:17:in `block (3 levels) in <top (required)>'"]
    end
  end

  describe '#build_pending' do
    subject { JSON.parse(template.build_pending(pending_example)) }

    it do
      expect(subject["message"]).to eq "No such step(0): "
      expect(subject["backtrace"]).to eq ["/path/to/hoge.feature:10"]
    end
  end
end


