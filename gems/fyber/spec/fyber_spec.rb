require 'spec_helper'

module Fyber
  describe Fyber do
    it 'has a version number' do
      expect(Fyber::VERSION).not_to be nil
    end

    it "needs to be configured" do
      Fyber.configuration = nil

      expect { Fyber.configure{|c|} }.to raise_exception(NotConfiguredException)
    end
  end
end
