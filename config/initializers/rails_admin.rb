# encoding: UTF-8

# RailsAdmin config file. Generated on February 04, 2012 17:33
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|
  #config.authorize_with :cancan
  config.audit_with :paper_trail, User

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  require 'i18n'
  I18n.default_locale = :fr

  config.current_user_method { current_user } # auto-generated
  
  # If you want to track changes on your models:
  # config.audit_with :history, User
  
  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, User
  
  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Reunir Admin', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [User]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [User]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  # config.model User do
  #   # Found associations:
  #   # Found columns:
  #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  config.model Address do
    navigation_label 'Paramètres'
    configure :addressable do
      visible false
    end
    list do
      field :addressable do
        visible true
      end
      field :line1 do
        label "Adresse"
      end
      field :zip
    end
    show do
      field :addressable do
        :name
      end
      field :content do
        pretty_value do
          bindings[:view].render :partial => "address_content", :locals => {:addressable => bindings[:object]}
        end
      end
    end
  end
  
  config.model Category do
    navigation_label 'Paramètres'
    list do
      field :name
      field :questionnaire_id
      field :fusion_group_id
      field :fusion_question_id
      field :nombre_de_questionnaires
    end
    show do
      field :name
      field :questionnaire_id
      field :fusion_group_id
      field :fusion_question_id
    end
  end

  config.model GroupeEnfant do
    navigation_label 'Paramètres'
    list do
      field :name
      field :nombre_de_profils
    end
    show do
      field :name
      field :profils
      field :nombre_de_profils
    end
  end
  
  config.model GroupeParent do
    navigation_label 'Paramètres'
    list do
      field :name
      field :nombre_de_profils
    end
    show do
      field :name
      field :profils
      field :nombre_de_profils
    end
  end
  
  config.model Questionnaire do
    navigation_label 'Paramètres'
    list do
      field :id
      field :category
      field :profil
      field :user
    end
    show do
      field :profil
      field :content do
        pretty_value do
          bindings[:view].render :partial => "questionnaire_content", :locals => {:questionnaire => bindings[:object]}
        end
      end
    end
    edit do
      field :profil
      field :content do
        partial "content_edit"
      end
    end
  end
  
  config.model Medecin do
    navigation_label 'Ressources humaines'
    list do
      field :title
      field :specialty
      field :organization_member
      field :profils_count
    end
    edit do
      group :edit_information_de_base do
        label "Informations de base"
        field :name do
          label "Dr. (Nom Prénom)"
        end
        field :specialty
        field :organization_member
      end
      group :edit_information_complementaire do
        label "Informations complémentaires"
        field :email
        field :address
      end
      group :edit_patients do
        label "Patients en charge"
        field :profils
      end
    end
    
    show do
      group :show_information_de_base do
        label "Informations de base"
        field :title
        field :specialty
        field :org_member
      end
      group :show_information_complementaire do
        label "Informations complémentaires"
        field :email
        field :address do
          pretty_value do
            bindings[:view].render :partial => "address_content", :locals => {:addressable => bindings[:object].address}
          end
        end
      end
      group :show_patients do
        label "Patient(s) en charge"
        field :profils
      end
    end
    
  end
  
  config.model Profil do
    navigation_label 'Ressources humaines'
    weight -1
    edit do
      group :edit_information_de_base do
        label "Informations de base"
        help "Veuillez remplir les informations suivantes..."
        field :name
        field :email
        field :address
      end
      group :edit_information_complementaire do
        label "Informations complémentaires"
        help "Veuillez remplir les informations suivantes..."
        field :user
        field :groupe_enfant
        field :groupe_parent
        field :medecin
      end
      group :edit_information_questionnaire do
        label "Questionnaires"
        help "Gestion des questionnaires."
        field :questionnaires
      end
    end
    list do 
      field :name
      field :user
      field :groupe_enfant
      field :groupe_parent
      field :medecin
      field :nombre_de_questionnaires
    end
    show do 
      group :show_information_de_base do
        label "Informations de base"
        help "Nom et adresse."
        field :name
        field :email
        field :address do
          pretty_value do
            bindings[:view].render :partial => "address_content", :locals => {:addressable => bindings[:object].address}
          end
        end
      end
      group :show_information_questionnaire do
        label "Questionnaires"
        help "Gestion des questionnaires."
        field :questionnaires
        field :ajouter_un_questionnaire do
          pretty_value do
              @categories = Category.find(:all)
              bindings[:view].render :partial => "add_questionnaire", :locals => {:profil => bindings[:object], :categories => @categories}
          end
        end
      end
      group :show_information_complementaire do
        label "Informations complémentaires"
        help "Encadrants & groupe de soutients"
        field :user
        field :medecin do
          :title
        end
        field :groupe_enfant
        field :groupe_parent
      end
    end
  end
  
  config.model User do
    navigation_label 'Ressources humaines'
    list do
      field :name
      field :role
    end
    edit do
      field :name
      field :role
      field :email
      field :password
      field :password_confirmation
    end
  end
  
  config.model Zip do
    navigation_label 'Paramètres'
    edit do
      field :zipcode
      field :city
    end
  end
  
end
