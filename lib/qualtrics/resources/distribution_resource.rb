module Qualtrics
  class DistributionResource < ResourceKit::Resource
    include ErrorHandlingResourceable

    resources do
      action :all, 'GET /API/v3/distributions' do
        handler(200) do |response|
          body = JSON.parse(response.body)['result'].to_json
          DistributionMapping.extract_collection(body, :read)
        end
      end

      action :find, 'GET /API/v3/distributions/:id' do
        handler(200) { |response| DistributionMapping.extract_single(response.body, :read) }
      end

      action :create, 'POST /API/v3/distributions' do
        body { |object| DistributionMapping.representation_for(:create, object) }
        handler(200) do |response, object|
          object.id = JSON.parse(response.body)['result']['id']
          object
        end
      end

      action :create_thankyou, 'POST /API/v3/distributions/:id/thankyous' do
        body { |object| DistributionMapping.representation_for(:create_child, object) }
        handler(200) do |response, object|
          object.id = JSON.parse(response.body)['result']['distributionId']
          object
        end
      end

      action :create_reminder, 'POST /API/v3/distributions/:id/reminders' do
        body { |object| DistributionMapping.representation_for(:create_child, object) }
        handler(200) do |response, object|
          object.id = JSON.parse(response.body)['result']['distributionId']
          object
        end
      end
    end
  end
end