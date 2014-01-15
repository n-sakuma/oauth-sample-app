require 'spec_helper'

describe NextCoreClient do
  describe '#set_query (private)' do
    let!(:request_time){Time.now}
    let(:client){NextCoreClient.new(url) }
    before do
      Timecop.freeze(request_time)
    end

    context 'timestampパラメータに関して' do
      let!(:url) {'http://sample.com/aaa/bbb?para1=zz&para2=aa&ZZZ=zzz' }
      subject {client.instance_variable_get(:@parameter) }
      it {should be_include("timestamp=#{request_time.to_i}")}
    end

    context 'クエリの順番に関して' do
      let!(:url) {'http://sample.com/aaa/bbb?xxx=aa&aaa=zz&ZZZ=zzz&BBB=bbb' }
      subject {client.instance_variable_get(:@parameter) }
      it {should == "BBB=bbb&ZZZ=zzz&aaa=zz&timestamp=#{request_time.to_i}&xxx=aa&api_key=#{NextCoreClient::API_KEY}"}
    end

    after do
      Timecop.return
    end
  end
end
