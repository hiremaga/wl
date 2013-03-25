require 'spec_helper'
require 'tmpdir'

module Wl
  describe Dotwl do
    let(:fake_home) { Dir.mktmpdir('home') }

    before do
      Dir.stub(home: fake_home)
    end

    after do
      FileUtils.rmtree(fake_home)
    end

    describe '#dir' do
      it "creates the .wl directory in the user's home directory" do
        expect {
          subject.dir
        }.to change { File.directory?("#{Dir.home}/.wl") }.to(true)
      end

      it "is private" do
        subject.dir

        stat = File.stat("#{Dir.home}/.wl")
        sprintf("%o", stat.mode).should eq '40700'
      end
    end

    describe '#login' do
      before do
        fake_login = double(Models::Login, token: 'faketoken')
        subject.login(fake_login)
      end

      it 'saves the token for later use' do
        File.read("#{Dir.home}/.wl/token").should eq 'faketoken'
      end

      it 'saves the token privately' do
        stat = File.stat("#{Dir.home}/.wl/token")
        sprintf("%o", stat.mode).should eq '100600'
      end
    end
  end
end
