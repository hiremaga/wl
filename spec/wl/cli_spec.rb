require 'spec_helper'

module Wl
  describe CLI do
    subject do
      Wl::CLI.start(args)
    end

    context "by default" do
      let(:args) { [] }

      it 'prints helpful information by default' do
        output = capture(:stdout) { subject }
        output.should include("help [TASK]")
      end
    end

    describe 'login', vcr: {cassette_name: 'login'} do
      let(:args) { %w"login --email fake@example.com --password fakepass" }

      it 'retrieves a token on behalf of the user' do
        output = capture(:stdout) { subject }
        output.should include('"name":"fake@example.com"')
      end
    end
  end
end
