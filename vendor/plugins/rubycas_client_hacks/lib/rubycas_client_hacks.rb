# RubycasClientHacks
# Monkey punch our way around the CAS server in the test environment
module CASClient
  module Frameworks
    module Rails
      class Filter
         class << self
           def filter_with_override(controller)
             RAILS_DEFAULT_LOGGER.debug("****** In filter_with_override *********")
             if RAILS_ENV == 'test' && controller.params[:force_cas_user]
               controller.session[:cas_user] = controller.params[:force_cas_user]
               return true
             else
               return filter_without_override(controller)
             end
           end
           alias_method_chain :filter, :override
         end
      end
    end
  end
end