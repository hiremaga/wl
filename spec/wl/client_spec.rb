require 'spec_helper'

module Wl
  describe Client do
    let(:dotwl) { double(Dotwl, token: nil) }

    subject do
      Client.new(dotwl: dotwl)
    end

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

    describe '#tasks' do
      context 'when the user has logged in', vcr: {cassette_name: 'tasks'} do
        before do
          dotwl.stub(token: '131378dbc2490bf87b6080ad6aeb758a46673270bbca9c7ea26f434473bbe741')
        end

        it 'lists all tasks' do
          tasks = subject.tasks
          tasks.map(&:title).should eq [
                                         "Do something you want",
                                         "Do something productive",
                                         "Do something useful"
                                       ]
        end
      end

      context 'when the user has not logged in', vcr: {cassette_name: 'tasks' } do
        it 'fails gracefully' do
          tasks = subject.tasks
          tasks.errors['type'].should eq('unauthorized')
        end
      end
    end
  end
end
