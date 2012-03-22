# encoding: UTF-8

# RailsAdmin config file. Generated on February 04, 2012 17:33
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|
  #config.authorize_with :cancan
  config.audit_with :paper_trail, User

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  require 'i18n'
  I18n.default_locale = :fr
  require "i18n/backend/fallbacks" 
  I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
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
  
  RailsAdmin.config do |config|
    config.actions do
      # root actions
      dashboard                     # mandatory
      root :data_mining do
        controller do 
          Proc.new do
            redirect_to "/datamining"
          end
        end 
      end
      # collection actions 
      index                         # mandatory
      new
      export
      history_index
      bulk_delete
      #collection :statistique, :base do
      #  controller do 
      #    Proc.new do
      #      render :partial => "render_stats", :locals => { :objects => list_entries}
      #    end  
      #  end 
      #end
      # member actions
      show
      edit
      delete
      history_show
      show_in_app
    end
  end
  
  config.model Address do
    visible do
      false
    end
    navigation_label 'Polymorphic'
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
  
  config.model Antecedent do
    visible do
      false
    end
    configure :antecedentable do
      visible false
    end
  end
  
  config.model BilanSanguin do
    visible do
      false
    end
    configure :bilanable do
      visible false
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
    visible do
      false
    end
    navigation_label 'Polymorphic'
    configure :commentable do
      visible false
    end
  end
  
  config.model Diagnostic do
    visible do
      false
    end
    navigation_label 'Polymorphic'
    configure :diagnosticable do
      visible false
    end
  end
  
  config.model Email do
    visible do
      false
    end
    navigation_label 'Polymorphic'
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
 
  config.model GroupeEnfant do
    navigation_label 'Groupes Enfants'
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
    navigation_label 'Groupes Parents'
    list do
      field :name
      field :nombre_de_tuteurs
    end
    show do
      field :name
      field :tuteurs
      field :nombre_de_tuteurs
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
        help "Renseigements principaux"
        field :last_name
        field :first_name
        field :specialty
        field :organization_member
        field :profils
      end
      group :edit_medecin_contact do
        active do
          false
        end
        label "Contacts"
        help "Moyens de contacts"        
        field :emails
        field :phones
        field :addresses
      end
      group :edit_medecin_patients do
        active do
          false
        end
        label "Patients en charge"
        help "Gestion des patients attribués à ce professionnel"
        field :profils
      end
      group :edit_medecin_commentaires do
        active do
          false
        end
        label "Commentaires"
        help "Notes & commentaires à propos de ce professionnel"        
        field :comments
      end
    end
    
    show do
      group :show_medecin_information_de_base do
        label "Informations de base"
        help "Renseigements principaux"
        field :name
        field :org_member
      end
      group :show_medecin_contact do
        label "Contacts"
        help "Moyens de contacts"
        field :info_emails_pp do
          label "Emails"
        end
        field :info_phones_pp do
          label "Téléphones"
        end
        field :info_addresses_pp do
          label "Adresses"
        end
      end
      group :show_medecin_patients do
        label "Patients en charge"
        help "Gestion des patients attribués à ce professionnel"
        field :profils
      end
      group :show_medecin_commentaires do
        label "Commentaires"
        help "Notes & commentaires à propos de ce professionnel"
        field :info_comments_pp  do
          label "Commentaires"
        end
      end
    end
  end
   
  config.model Objectif do
    visible do
      false
    end
    navigation_label 'Polymorphic'
    object_label_method do
      :objectif_type
    end
    configure :objectivable do
      visible false
    end
    edit do
      field :objectif_type
      field :objectif
      field :atteint
    end
  end
  
  config.model Phone do
    visible do
      false
    end
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
        label "Renseignements scolaire"
        help "Établissement fréquenté"
        field :school
        field :classroom
        field :redoublement
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
        label "Accompagnement & suivi éducatif"
        help "Responsables légaux & professionnels de santé"
        field :user
        field :groupe_enfant
        field :medecins
      end
      group :edit_profil_foyer do
        active false
        label "Foyer"
        help "Informations concernant le foyer"
        field :tuteurs
        field :situation_maritale_des_parents
        field :fratrie
        field :rang_dans_la_fratrie
        field :fratrie_en_surpoids
        field :habitant_du_foyer
        field :type_de_logement
        field :television
        field :ordinateur
        field :parabole
        field :internet
      end
      group :edit_profil_medicament do
        active false
        label "Traitements médicamenteux"
        help "Corticoïde, antihistaminique, antiépiléptique..."
        field :corticoide
        field :antihistaminique
        field :antiepileptique
      end
      group :edit_profil_antecedent do
        active false
        label "Antécedents"
        help "Diabète, cholestérol, hypertension, maladies cardiovasculaires..."
        field :antecedents
      end
      group :edit_profil_natalite do
        active false
        label "Natalité"
        help "Informations sur le suivi médical et la santé de l'enfant à la naissance"  
        
        field :poids_naissance do
          help "en Kg"
        end
        field :taille_naissance do
          help "en cm"
        end
        field :diabete_gestationnel
        field :terme_sa do
          help "en semaines d'aménorrhée"
        end
        field :allaitement
        field :duree_allaitement do
          help "en mois"
        end
        field :rciu do
          help "Retard de croissance intra-utérin"
        end
        field :pma do
          help "Procréation médicalement assistée"
        end   
        field :comments
      end
      group :edit_profil_histoire_obesite do
        active false
        label "Histoire de l'obésité"
        help "Informations relative à l'apparition de l'obésité"
        field :rebond_ponderal_precoce
        field :age_obesite
        field :facteur_declenchant
        field :prise_en_charge_anterieure
      end  
     
      group :edit_profil_mesure do
        active false
        label "Mesure anthropométriques"
        help "Collecte de données du carnet de santé"
        field :profil_mesures do
          orderable true
        end
      end    
      group :show_profil_bilans do
        active false
        label "Bilan sanguin"
        help "Biochimie sanguine (Glycémie, Tryglycérides, Choléstérol, HDL, LDL, T4L, TSH)"
        field :bilan_sanguins
      end
      group :edit_profil_objectifs do
        active false
        label "Objectifs"
        help "Définition des objectifs"
        field :objectifs
      end
      group :edit_profil_diagnostics do
        active false
        label "Diagnostics"
        help "Diagnostics des entretiens thérapeutiques pédiatriques individuels"
        field :diagnostics
      end
    group :edit_profil_complement do
        active false
        label "Complément d'information"
        help "Collecte d'info supplémentaire"
        field :comments
      end
      group :edit_profil_questionnaires do
        active false
        label "Questionnaires"
        help "Gestion des questionnaires."
        field :questionnaires
      end
    end
    list do
      field :id
      field :last_name
      field :first_name
      field :user
      field :groupe_enfant
      field :created_at do
        label "Inscrit le"
      end
    end  
    show do
      group :show_profil_identity do
        label "Informations de base"
        help "Fiche identité"
        field :name
        field :gender
        field :birthdate
      end
      group :show_profil_ecole do
        label "Renseignements scolaire"
        help "Établissement fréquenté"
        field :school
        field :classroom
        field :redoublement
      end
      group :show_profil_contact do
        label "Contact"
        help "Moyens de contact"
        field :info_emails_pp do
          label "Emails"
        end        
        field :info_phones_pp do
          label "Téléphones"
        end        
        field :info_addresses_pp do
          label "Adresses"
        end
      end   
      group :show_profil_encadrement do
        label "Accompagnement & suivi éducatif"
        help "Responsables légaux & professionnels de santé"
        field :user
        field :medecins
        field :groupe_enfant
      end 
      group :show_profil_foyer do
        active false
        label "Foyer"
        help "Les responsables légaux et le foyer"
        field :tuteurs
        field :info_foyer_pp do
          label "Information relative au foyer"
        end
      end
      group :show_profil_medicament do
        label "Traitements médicamenteux"
        help "Corticoïde, antihistaminique, antiépiléptique..."
        field :corticoide
        field :antihistaminique
        field :antiepileptique
      end
      group :show_profil_antecedent do
        label "Antécedents"
        help "Diabète, cholestérol, hypertension, maladies cardiovasculaires..."
        field :antecedents
      end
      group :show_profil_natalite do
        label "Natalité"
        help "Informations sur le suivi médical et la santé de l'enfant à la naissance"  
        field :info_naissance_pp do
          label "Information relative à la naissance"
        end
      end
      group :show_profil_obesite do
        label "Histoire de l'obésité"
        help "Informations relative à l'apparition de l'obésité"
        field :info_obesite_pp do
          label "Histoire de l'obésité"
        end
      end 
      group :show_profil_bilan_sanguins do
        label "Bilan sanguin"
        help "Biochimie sanguine (Glycémie, Tryglycérides, Choléstérol, HDL, LDL, T4L, TSH)"
        field :bilan_sanguins
      end
      group :show_profil_mesures do
        label "Mesure anthropométriques"
        help "Collecte de données du carnet de santé"
        field :info_mesures_pp do
          label "Mesures"
        end
      end
      group :show_profil_diagnostics do
        label "Diagnostics"
        help "Diagnostics des entretiens thérapeutiques pédiatriques individuels"
        field :info_diagnostics_pp do
           label "Diagnostics"
        end
      end
      group :show_profil_commentaire do
        label "Commentaires"
        help "Notes & commentaires divers"
        field :info_comments_pp do
           label "Commentaires"
        end
      end
      group :show_profil_objectifs do
        label "Objectifs"
        help "Définition des objectifs"
        field :info_objectifs_pp do
           label "Objectifs"
        end
      end
      group :show_profil_seances do
        label "Séance d'éducation thérapeutique"
        help "État de présence"
        field :seance_enfants do
           label "Séances"
        end
      end
      group :show_profil_questionnaire do
        label "Questionnaires"
        help "Gestion des questionnaires."
        field :questionnaires
        field :questionnaire_add do
          pretty_value do
              @categories = Category.find(:all)
              bindings[:view].render :partial => "questionnaire_add", :locals => {:profil => bindings[:object], :categories => @categories}
          end
        end
      end
    end
  end
 
  config.model ProfilMesure do
    navigation_label 'Mesures anthropométriques'
    object_label_method do
      :date_of_mesure
    end
    configure :mesurable do
      visible false
    end
    list do
      field :profil
      field :date_of_mesure
      field :imc
      field :z_score
      field :degre_obesite
    end
    edit do
      field :profil
      field :date_of_mesure
      field :poids do
        help "en Kg"
      end  
      field :taille do
        help "en cm"
      end
      field :tour_de_taille do
        help "en cm"
      end
      field :tour_de_hanches do
        help "en cm"
      end
      field :z_score
      field :degre_obesite
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
  
  config.model SeanceEnfant do
    navigation_label 'Groupes Enfants'
    edit do
      field :date_of_seance
      field :groupe_enfant
      field :theme
      field :profils do
        associated_collection_scope do
          # bindings[:object] & bindings[:controller] are available, but not in scope's block!
          seance_enfant = bindings[:object]
          Proc.new { |scope|
            # scoping all Players currently, let's limit them to the team's league
            # Be sure to limit if there are a lot of Players and order them by position
            scope = scope.where(groupe_enfant_id: seance_enfant.groupe_enfant) if seance_enfant.present?
            scope = scope.order('profils.last_name DESC')
          }
        end
      end
      field :comments
    end
    show do
      field :date_of_seance
      field :groupe_enfant
      field :theme
      field :profils
      field :info_comments_pp do
        label "Commentaires"
      end
    end
  end
   
  config.model SeanceParent do
    navigation_label 'Groupes Parents'
    edit do
      field :date_of_seance
      field :groupe_parent
      field :theme
      field :tuteurs do
        associated_collection_scope do
          # bindings[:object] & bindings[:controller] are available, but not in scope's block!
          seance_parent = bindings[:object]
          Proc.new { |scope|
            # scoping all Players currently, let's limit them to the team's league
            # Be sure to limit if there are a lot of Players and order them by position
            scope = scope.where(groupe_parent_id: seance_parent.groupe_parent) if seance_parent.present?
            scope = scope.order('parents.last_name DESC')
          }
        end
      end
      field :comments
    end
    show do
      field :date_of_seance
      field :groupe_parent
      field :theme
      field :tuteurs
      field :info_comments_pp do
        label "Commentaires"
      end
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
      group :edit_tuteur_identity do
        label "Informations de base"
        help "Renseigements principaux"
        field :tuteur_type
        field :last_name
        field :first_name
        field :birthdate
        field :profession
        field :groupe_parent
      end
      group :edit_tuteur_mesure do
        active false
        label "Mesure anthropométriques"
        help "Collecte de données du carnet de santé"
        field :tuteur_mesures
      end
      group :edit_tuteur_patients do
        active do
          false
        end
        label "Enfants à charge"
        help "Gestion des enfants à charge de ce parent"
        field :profils
      end
      group :edit_tuteur_commentaires do
        active do
          false
        end
        label "Commentaires"
        help "Notes & commentaires à propos de parent"        
        field :comments
      end
    end
    
    show do
      group :show_tuteur_information_de_base do
        label "Informations de base"
        help "Renseigements principaux"
        field :name
        field :birthdate
        field :profession
        field :groupe_parent
      end
      group :show_tuteur_profils do
        label "Enfants à charge"
        help "Gestion des enfants à charge de ce parent"
        field :profils
      end
      group :show_tuteur_mesure do
        active false
        label "Mesure anthropométriques"
        help "Collecte de données du carnet de santé"
        field :info_mesures_pp do
          label "Mesures"
        end
      end
      group :show_tuteur_seances do
        label "Séance d'éducation thérapeutique"
        help "État de présence"
        field :seance_parents do
           label "Séances"
        end
      end
      group :show_tuteur_commentaires do
        label "Commentaires"
        help "Notes & commentaires à propos de ce parent"
        field :info_comments_pp  do
          label "Commentaires"
        end
      end
    end
  end
   
  config.model TuteurMesure do
    navigation_label 'Mesures Anthropométriques'
    object_label_method do
      :date_of_mesure
    end
    configure :mesurable do
      visible false
    end
    list do
      field :tuteur
      field :date_of_mesure
      field :imc
      field :z_score
      field :degre_obesite
    end
    edit do
      field :tuteur
      field :date_of_mesure
      field :poids do
        help "en Kg"
      end  
      field :taille do
        help "en cm"
      end
      field :tour_de_taille do
        help "en cm"
      end
      field :tour_de_hanches do
        help "en cm"
      end
      field :z_score
      field :degre_obesite
    end
  end
 
  config.model User do
    navigation_label 'Ressources humaines'
    list do
      field :last_name
      field :first_name
      field :role
      field :email
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
  
  config.model Zip do
    navigation_label 'Paramètres'
    edit do
      field :zipcode
      field :city
    end
  end
  
  
end

