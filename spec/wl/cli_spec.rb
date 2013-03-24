require 'spec_helper'

module Wl
  describe CLI do
    context "by default" do
      let(:args) { [] }

      it 'prints helpful information by default' do
        output = capture(:stdout) { Wl::CLI.start(args) }
        output.should include("help [TASK]")
      end
    end

    describe 'login', vcr: {cassette_name: 'login'} do
      let(:args) { %w"login --email fake@example.com --password fakepass" }

      it 'retrieves a token on behalf of the user' do
        output = capture(:stdout) { Wl::CLI.start(args) }
        output.should include('"name":"fake@example.com"')
      end
    end

    def capture(stream)
      begin
        stream = stream.to_s
        eval "$#{stream} = StringIO.new"
        yield
        result = eval("$#{stream}").string
      ensure
        eval("$#{stream} = #{stream.upcase}")
      end

      result
    end
  end
end
