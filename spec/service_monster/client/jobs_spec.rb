require 'spec_helper'

RSpec.describe ServiceMonster::Client::Jobs do
  
  before do
    @client = ServiceMonster::Client.new
  end

  describe '#jobs' do

    before do
    end

    it 'should return a list of jobs' do
      stub_get("jobs").to_return(body: fixture('jobs_list.json'), :headers => {:content_type => "application/json; charset=utf-8", authorization: 'Basic blah'})
      result = @client.jobs
      expect(a_get("jobs")).to have_been_made
      expect(result[:count]).to eq(5)
      expect(result.items.size).to eq(5)
    end

    it 'should filter by date' do
      WebMock.allow_net_connect!
      @client.api_key = 'Q0xfQVBJVVNFUjoyYnNtYkU1ZjJONHNOUGo=';
      result = @client.jobs({:wField => 'actualDateTimeStart', :wOperator => 'gt', :wValue => '2015-06-05'})
      WebMock.disable_net_connect!
      expect(result[:count]).to eq(1)
      expect(result.items[0].note).to eq("Test new job")

    end
  end

end
