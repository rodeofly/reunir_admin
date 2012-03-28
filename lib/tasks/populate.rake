# encoding: UTF-8
begin
  n_profil = 50
  namespace :db do  
    desc "Populate the development database with some fake data"  
    task :populate => :environment do  
      5.times do
        Zip.create! :zipcode => Forgery::Address.zip, :city => Forgery::Address.city
      end
      
      5.times do
        School.create! :schooltype => ['École Primaire', 'École Élémentaire', 'Collège', 'Lycée', 'Lycée Professionnel'].sample, 
        :name => Forgery::Name.full_name,
        :zip_id => Zip.find(:all, :select => 'id').map(&:id).sample
      end
      
      5.times do
        Medecin.create! :first_name => Forgery::Name.first_name, 
        :last_name => Forgery::Name.last_name,
        :specialty => ['Médecin généraliste', 'Pédiatre', 'Endocrinologue', 'Psychiatre', 'Psychologue'].sample,
        :organization_member => Forgery::Basic.boolean
      end
      
      5.times do
        User.create! :first_name => Forgery::Name.first_name, 
        :last_name => Forgery::Name.last_name,
        :role => ["Administrateur", "Éducateur"].sample,
        :email => Forgery::Internet.email_address,
        :password => Forgery(:basic).password(:at_least => 6, :at_most => 10)
      end
      
      5.times do
        GroupeEnfant.create! :name => Forgery::Address.city
      end
      
      5.times do
        GroupeParent.create! :name => Forgery::Address.city
      end
      
      5.times do
        Tuteur.create! :first_name => Forgery::Name.first_name, 
        :last_name => Forgery::Name.last_name,
        :tuteur_type => "Père",
        :birthdate => rand(60.years).ago,
        :profession => ['agriculteur exploitant (secteur primaire)' ,'artisan, commerçant ou entrepreneur' ,'cadre ou profession intellectuelle supérieure' ,'profession intermédiaire' ,'employé' ,'ouvrier' ,'retraité' ,'sans activité professionnelle' ].sample,
        :groupe_parent => GroupeParent.all.sample
      end
      
      5.times do
        Tuteur.create! :first_name => Forgery::Name.first_name, 
        :last_name => Forgery::Name.last_name,
        :tuteur_type => "Mère",
        :birthdate => rand(60.years).ago,
        :profession => ['agriculteur exploitant (secteur primaire)' ,'artisan, commerçant ou chef entrepreneur' ,'cadre ou profession intellectuelle supérieure' ,'profession intermédiaire' ,'employé' ,'ouvrier' ,'retraité' ,'sans activité professionnelle' ].sample,
        :groupe_parent => GroupeParent.all.sample
      end
      
      n_profil.times do
        g_sample = ['Masculin', 'Féminin'].sample
        if g_sample == 'Masculin'
          first_name_sample = Forgery::Name.male_first_name
        else
          first_name_sample = Forgery::Name.female_first_name
        end
        fratrie = Forgery(:basic).number(:at_least => 0, :at_most => 10)
        Profil.create! :first_name => first_name_sample, 
        :last_name => Forgery::Name.last_name,
        :date_inclusion => rand(18.years).ago,
        :gender => g_sample,
        :birthdate => rand(18.years).ago,
        :classroom => ['Petite Section', 'Moyenne Section', 'Grande Section', 'CP', 'CE1', 'CE2', 'CM1', 'CM2', '6ème', '5ème', '4ème', '3ème', '2nde', '1ère', 'Terminale'].sample,
        :school_id => School.find(:all, :select => 'id').map(&:id).sample,
        :medecin_id => Medecin.find(:all, :select => 'id').map(&:id).sample,
        :user_id => User.find(:all, :select => 'id').map(&:id).sample,
        :groupe_enfant_id => GroupeEnfant.find(:all, :select => 'id').map(&:id).sample,
        :taille_naissance => Forgery(:basic).number(:at_least => 30, :at_most => 60),
        :poids_naissance => Forgery(:basic).number(:at_least => 2, :at_most => 5),
        :terme_sa => Forgery(:basic).number(:at_least => 35, :at_most => 42),
        :rciu => Forgery::Basic.boolean,
        :pma => Forgery::Basic.boolean,
        :diabete_gestationnel => Forgery::Basic.boolean,
        :allaitement => Forgery::Basic.boolean,
        :duree_allaitement => Forgery(:basic).number(:at_least => 0, :at_most => 24),
        :rebond_ponderal_precoce => Forgery::Basic.boolean,
        :age_obesite => Forgery(:basic).number(:at_least => 0, :at_most => 18),
        :facteur_declenchant =>     ['Déménagement', 'Naissance', "Décés"].sample,
        :prise_en_charge_anterieure => Forgery::Basic.boolean,
        :redoublement => Forgery::Basic.boolean,
        :situation_maritale_des_parents =>     ['Mariés', 'Pacsé', 'En concubinage', 'Séparé', 'Isolé', 'Veuf', 'Famille recomposée'].sample,
        :fratrie => fratrie,
        :rang_dans_la_fratrie => Forgery(:basic).number(:at_least => 1, :at_most => fratrie+1),
        :fratrie_en_surpoids => rand(2),
        :habitant_du_foyer => Forgery(:basic).number(:at_least => fratrie+2, :at_most => fratrie+7),
        :type_de_logement => ['Appartement', 'Maison'].sample,
        :television => Forgery(:basic).number(:at_least => 0, :at_most => 10),
        :ordinateur => Forgery(:basic).number(:at_least => 0, :at_most => 10),
        :parabole => Forgery::Basic.boolean,
        :internet => Forgery::Basic.boolean,
        :corticoide =>     ['jamais', '- de 1 mois', '- de 3 mois', '- de 1 an', '+ de 1 an'].sample,
        :antihistaminique =>     ['jamais', '- de 1 mois', '- de 3 mois', '- de 1 an', '+ de 1 an'].sample,
        :antiepileptique =>     ['jamais', '- de 1 mois', '- de 3 mois', '- de 1 an', '+ de 1 an'].sample
      end
      
      Tuteur.all.each do |parent|
        5.times do
          TuteurMesure.create! :date_of_mesure => rand(18.years).ago,
          :poids => Forgery(:basic).number(:at_least => 10, :at_most => 100),
          :taille => Forgery(:basic).number(:at_least => 100, :at_most => 180),
          :tour_de_taille  => Forgery(:basic).number(:at_least => 60, :at_most => 120),
          :tour_de_hanches  => Forgery(:basic).number(:at_least => 60, :at_most => 120),
          :z_score  => Forgery(:basic).number(:at_least => 20, :at_most => 50),
          :degre_obesite => ['normal', 'corrigé', 'surpoids', 'obésité', 'obésité sévère', 'obésité morbide'].sample,
          :tuteur_id => parent.id
        end
      end
      
      Profil.all.each do |enfant|
        enfant.tuteurs << Tuteur.where(:tuteur_type => 'Père').sample
        enfant.tuteurs << Tuteur.where(:tuteur_type => 'Mère').sample
        enfant.medecins << Medecin.all.sample
        5.times do
          ProfilMesure.create! :date_of_mesure => rand(18.years).ago,
          :poids => Forgery(:basic).number(:at_least => 10, :at_most => 100),
          :taille => Forgery(:basic).number(:at_least => 100, :at_most => 180),
          :tour_de_taille  => Forgery(:basic).number(:at_least => 60, :at_most => 120),
          :tour_de_hanches  => Forgery(:basic).number(:at_least => 60, :at_most => 120),
          :z_score  => Forgery(:basic).number(:at_least => 20, :at_most => 50),
          :degre_obesite => ['normal', 'corrigé', 'surpoids', 'obésité', 'obésité sévère', 'obésité morbide'].sample,
          :profil_id => enfant.id
        end
        
        2.times do
          Email.create! :email_type => ['Personnelle', 'Privée', 'Bureau', 'Père', 'Mère', 'Enfant', 'Autre'].sample,
          :email => Forgery::Internet.email_address,
          :emailable_id => enfant.id,
          :emailable_type => "Profil"
        end
        
        2.times do
          Phone.create! :phone_type => ['Domicile', 'Mobile', 'Bureau', 'Père', 'Mère', 'Enfant'].sample,
          :number => Forgery(:address).phone,
          :phonable_id => enfant.id,
          :phonable_type => "Profil"
        end
        
        2.times do
          Address.create! :address_type => ['Domicile', 'Bureau', 'Père', 'Mère', 'Enfant', 'Autre'].sample,
          :line1 => Forgery(:address).street_address,
          :line2 => Forgery(:address).province,
          :zip_id => Zip.find(:all, :select => 'id').map(&:id).sample,
          :country => Forgery(:address).country,
          :addressable_id => enfant.id,
          :addressable_type => "Profil"
        end
        
        ['Père', 'Mère', 'Grands-parents'].each do |parent|
          if (rand(1))
            Antecedent.create! :antecedent_type => ['Diabète', 'Hyper choléstérol', 'Hypertension', 'Maladies cardiovascilulaire'].sample,
            :parent => parent,
            :antecedentable_id => enfant.id,
            :antecedentable_type => "Profil"
          end
        end
      end
    end  
  end  
rescue LoadError  
  puts "Please run: sudo gem install forgery"  
end