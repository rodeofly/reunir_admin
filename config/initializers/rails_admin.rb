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
  # config/initilizers/rails_admin.rb
  # config/initilizers/rails_admin.rb
  
  #RailsAdmin.config do |config|
  #  config.actions do
  #    # root actions
  #   dashboard                     # mandatory
  #    # collection actions 
  #    index                         # mandatory
  #    new
  #    export
  #    history_index
  #   bulk_delete
  #    # member actions
  #    show
  #    edit
  #    delete
  #    history_show
  #    show_in_app
  #    member :pdf, :base do 
  #      controller do 
  #        Proc.new do 
  #          output = PdfReport.new 
  #          send_data output.to_pdf(@object), :filename => "profil...@object.id}.pdf", :type => "application/pdf" 
  #        end 
  #      end 
  #    end 
  #  end
  #end
  
  
 
  
  config.model Email do
    navigation_label 'Autres'
    object_label_method do
      :email_type
    end
    configure :emailable do
      visible false
    end
    list do
      field :emailable do
        visible true
      end
      field :email
      field :email_type
    end
  end
  
  
  
  config.model Address do
    navigation_label 'Autres'
    object_label_method do
      :address_type
    end
    
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

  config.model Comment do
    navigation_label 'Autres'
    configure :commentable do
      visible false
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
  
  config.model Medecin do
    navigation_label 'Ressources humaines'
    list do
      field :specialty
      field :last_name
      field :first_name  
      field :organization_member
      field :profils_count
    end
    edit do
      group :edit_medecin_identity do
        label "Informations de base"
        field :last_name
        field :first_name
        field :specialty
        field :organization_member
      end
      group :edit_medecin_information_complementaire do
        label "Informations complémentaires"
        field :email
        field :phone
        field :address
        field :comments
      end
      group :edit_patients do
        label "Patients en charge"
        field :profils
      end
    end
    
    show do
      group :show_medecin_information_de_base do
        label "Informations de base"
        field :name
        field :org_member
      end
      group :show_medecin_information_complementaire do
        label "Informations complémentaires"
        field :email
        field :phone
        field :address
        field :comments
      end
      group :show_medecin_patients do
        label "Patient(s) en charge"
        field :profils
      end
    end
  end
  
  config.model Phone do
    navigation_label 'Autres'
    object_label_method do
      :phone_type
    end
    configure :phonable do
      visible false
    end
    list do
      field :phonable do
        visible true
      end
      field :number
      field :phone_type
    end
  end
  
  config.model Profil do
    navigation_label 'Ressources humaines'
    weight -1 
    edit do
      group :edit_profil_identity do
        label "Informations de base"
        help "Fiche identité"
        field :last_name
        field :first_name
        field :gender
        field :birthdate
      end
      group :edit_profil_school do
        active false
        label "Établissement scolaire"
        help "Informations concernant la scolarité" 
        field :school
        field :classroom
      end
      group :edit_profil_contact do
        active false
        label "Contact"
        help "Moyens de contact"
        field :emails
        field :phones
        field :addresses
      end
      group :edit_profil_encadrement do
        active false
        label "Encadrement"
        help "Encadrants de l'enfant"
        field :tuteurs
        field :user
        field :groupe_enfant
        field :medecin
      end
      group :edit_profil_complement do
        active false
        label "Complément d'information"
        help "Collecte d'info supplémentaire"
        field :questionnaires
        field :comments
      end
    end
    list do
      field :id
      field :last_name
      field :first_name
      field :user
      field :groupe_enfant
      field :medecin
      field :created_at
    end
    
    show do
      group :show_profil_identity do
        label "Fiche d'identité"
        help "information essentielles"
        field :name
        field :gender
        field :birthdate
      end
      group :show_profil_ecole do
        label "Renseignements scolaire"
        help "Établissement fréquenté"
        field :school
        field :classroom
      end
      group :show_profil_contact do
        label "Informations de contacts"
        help "Différents moyens de communication"
        field :emails_pp do
          label "Emails"
        end        
        field :phones_pp do
          label "Téléphones"
        end        
        field :addresses_pp do
          label "Adresses"
        end
      end
      group :show_profil_encadrement do
        label "Encadrements"
        help "Ressources relatives à l'enfant"
        field :tuteurs
        field :user
        field :medecin
        field :groupe_enfant
        field :comments
      end
      group :show_profil_questionnaire do
        label "Questionnaires"
        help "Gestion des questionnaires."
        field :questionnaires
      end
    end
    
  end
  
  config.model Questionnaire do
    navigation_label 'Autres'
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
    update do
      field :profil
      field :content do
        partial "questionnaire_update"
      end
    end
  end
  
  config.model School do
    navigation_label 'Paramètres'
    list do
      field :schooltype
      field :name
      field :zip
    end
    edit do
      field :schooltype
      field :name
      field :zip
    end
  end
  
  config.model User do
    navigation_label 'Ressources humaines'
    list do
      field :last_name
      field :first_name
      field :role
    end
    edit do
      field :first_name
      field :last_name
      field :role
      field :email
      field :password
      field :password_confirmation
    end
  end
  
  config.model Tuteur do
    navigation_label 'Ressources humaines'
    list do
      field :tuteur_type
      field :last_name
      field :first_name
      field :groupe_parent
      field :profils
      field :created_at  
    end
    edit do
      field :tuteur_type
      field :last_name
      field :first_name
      field :profession
      field :groupe_parent
      field :emails
      field :phones
      field :addresses
      field :profils
      field :comments
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

