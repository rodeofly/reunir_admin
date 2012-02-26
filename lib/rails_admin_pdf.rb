require "rails_admin_pdf/engine"

module RailsAdminPdf
end

require 'rails_admin/config/actions'

module RailsAdmin
  module Config
    module Actions
      class Pdf < Base
        RailsAdmin::Config::Actions.register(self)
        
        register_instance_option :member do
          true
        end

    		register_instance_option :controller do
    		   Proc.new do
    		     report = "#{@object.class.to_s.demodulize}Report".constantize.new
    		  	 send_data report.to_pdf(@object), :filename => "#{@object.class.to_s.demodulize}_#{@object.id}.pdf", :type => "application/pdf"
    		   end
    		end
      end
    end
  end
end

