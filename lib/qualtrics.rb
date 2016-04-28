require "qualtrics/version"
require "resource_kit"
require "kartograph"

module Qualtrics
  autoload :Client,                     'qualtrics/client'

  # Models
  autoload :BaseModel,                  'qualtrics/models/base_model'
  autoload :Organization,               'qualtrics/models/organization'
  autoload :Survey,                     'qualtrics/models/survey'
    Survey.autoload :Expiration,        'qualtrics/models/survey/expiration'

  # Resources
  autoload :OrganizationResource,       'qualtrics/resources/organization_resource'
  autoload :SurveyResource,             'qualtrics/resources/survey_resource'

  # JSON Maps
  autoload :OrganizationMapping,        'qualtrics/mappings/organization_mapping'
  autoload :SurveyMapping,              'qualtrics/mappings/survey_mapping'
  autoload :ExpirationMapping,          'qualtrics/mappings/expiration_mapping'

  # Utils
  autoload :ErrorHandlingResourceable,  'qualtrics/error_handling_resourceable'

  # Errors
  autoload :ErrorMapping,               'qualtrics/mappings/error_mapping'
  Error = Class.new(StandardError)
  FailedCreate = Class.new(Qualtrics::Error)
  FailedUpdate = Class.new(Qualtrics::Error)

  class RateLimitReached < Qualtrics::Error
    attr_accessor :reset_at
    attr_writer :limit, :remaining

    def limit
      @limit.to_i if @limit
    end

    def remaining
      @remaning.to_i if @remaning
    end
  end
end
