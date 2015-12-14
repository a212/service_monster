require 'spec_helper'

RSpec.describe ServiceMonster::Client::Reminders do
  
  before do
    @client = ServiceMonster::Client.new
  end

  describe '#reminders' do

    before do
      stub_get("reminders").to_return(body: fixture('reminders_list.json'), :headers => {:content_type => "application/json; charset=utf-8", authorization: 'Basic blah'})
    end

    it 'should return a list of reminders' do
      result = @client.reminders
      expect(a_get("reminders")).to have_been_made
      expect(result[:count]).to eq(2)
    end

    it 'should filter by date' do
        WebMock.allow_net_connect!
        @client.api_key = 'Q0xfQVBJVVNFUjoyYnNtYkU1ZjJONHNOUGo=';
        result = @client.reminders({:wField => 'startDateTime', :wOperator => 'lt', :wValue => '2015-06-05'})
        WebMock.disable_net_connect!
        expect(result[:count]).to eq(78)
      end

  end

end
