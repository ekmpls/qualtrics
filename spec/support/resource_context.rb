shared_context 'resources' do
  let(:client)      { Qualtrics::API::Client.new(api_token: 'not_real', data_center_id: 'org') }
  let(:connection)  { client.connection }
end
