require 'spec_helper'
require 'turnip_formatter/step_template/source'

describe TurnipFormatter::StepTemplate::Source do
  let(:template) do
    described_class.new
  end

  describe '#build' do
    subject { JSON.parse(template.build(failed_example)) }

    it do
      expect(subject["code"]).to include '<span class="linenum">'
    end
  end
end
