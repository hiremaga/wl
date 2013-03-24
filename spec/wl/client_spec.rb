require 'spec_helper'

module Wl
  describe Client do
    describe '#login' do
      context 'when the email address and password are accepted', vcr: {cassette_name: 'login'} do
        it 'packages the api response in a Login object' do
          response = subject.login('fake@example.com', 'fakepass')
          response.should be_a(Login)
          response.email.should == 'fake@example.com'
        end
      end

      context 'when something goes wrong' do
        it 'fails fast printing the raw api response', vcr: {cassette_name: 'login'} do
          expect {
            subject.login('fake@example.com', 'badpassword')
          }.to raise_error /We were unable to locate a user based on the credentials you supplied/
        end
      end
    end
  end
end
