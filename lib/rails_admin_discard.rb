require "rails_admin_discard/engine"

module RailsAdminDiscard
  # Your code goes here...
end

require 'rails_admin/config/actions'

module RailsAdmin
  module Config
    module Actions
      class Discard < Base
        RailsAdmin::Config::Actions.register(self)
        
        register_instance_option :object_level do
          true
        end

        register_instance_option :member do
          true
        end

        register_instance_option :route_fragment do
          'discard'
        end

        register_instance_option :http_methods do
          [:get, :delete]
        end

        register_instance_option :authorization_key do
          :destroy
        end

        register_instance_option :controller do
          proc do
            if request.get? # DELETE

              if @object.discarded?
                flash[:error] = t('admin.discard.unremoved', model_label: @model_config.label)
                @object.undiscard

                redirect_to index_path
              else
                respond_to do |format|
                  format.html { render @action.template_name }
                  format.js   { render @action.template_name, layout: false }
                end  
              end
            elsif request.delete? # DESTROY
              redirect_path = nil
              @auditing_adapter && @auditing_adapter.delete_object(@object, @abstract_model, _current_user)
              

              if @object.discard
                flash[:success] = t('admin.flash.successful', name: @model_config.label, action: t('admin.actions.delete.done'))
                redirect_path = index_path
              else
                flash[:error] = t('admin.flash.error', name: @model_config.label, action: t('admin.actions.delete.done'))
                redirect_path = back_or_index
              end

              redirect_to redirect_path

            end
          end
        end

        register_instance_option :link_icon do
          'icon-remove'
        end
      end
    end
  end
end

