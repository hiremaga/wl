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

      context 'when an email and password are not provided' do
        let(:args) { %w"login" }

        it 'asks the user for each' do
          ui = mock(HighLine).as_null_object
          HighLine.stub(new: ui)
          ui.should_receive(:ask).with('Wunderlist email: ').and_return('foo@example.com')
          ui.should_receive(:ask).with('Wunderlist password: ').and_return('foopass')

          client = mock(Wl::Client)
          Wl::Client.stub(new: client)
          client.should_receive(:login).with('foo@example.com', 'foopass')

          subject
        end
      end
    end
  end
end
