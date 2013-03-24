require 'spec_helper'

module Wl
  describe Client do
    describe '#login' do
      context 'when the email address and password are accepted', vcr: {cassette_name: 'login'} do
        it 'packages the api response in a Login object' do
          response = subject.login('fake@example.com', 'fakepass')
          response.should be_a(Login)
          response.email.should == 'fake@example.com'
          response.errors.should be_nil
        end
      end

      context 'when something goes wrong' do
        it 'inserts the errors into the Login object', vcr: {cassette_name: 'login'} do
          response = subject.login('fake@example.com', 'badpassword')
          response.should be_a(Login)
          response.email.should be_nil
          response.errors['type'].should eq('not_found.no_such_user')
        end
      end
    end
  end
end
