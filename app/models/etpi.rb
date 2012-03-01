# encoding: UTF-8
class Etpi < ActiveRecord::Base
  belongs_to :etpiable, :polymorphic => true
  
  def relation_avec_les_camarades_enum
    ['Bonne', 'Moyenne', 'Difficile']
  end
  
  def activite_physique_a_l_ecole_enum
    ['0h', '<2h', '2h à 4h', '4h à 6h', '>6h']
  end
  def activite_physique_en_club_enum
    ['0h', '<2h', '2h à 4h', '4h à 6h', '>6h']
  end
  def activite_physique_a_la_maison_enum
    ['0h', '<2h', '2h à 4h', '4h à 6h', '>6h']
  end
  def mode_du_trajet_ecole_maison_enum
    ['A pied/vélo', 'Bus/Voiture/Moto']
  end
  
  def activite_sedentaire_devant_l_ordinateur_enum
    ['0h', '<3h', '3h à 7h', '7h à 14h', '>14h']
  end
  def activite_sedentaire_devant_la_television_enum
    ['0h', '<3h', '3h à 7h', '7h à 14h', '>14h']
  end
  def activite_physique_des_parents_enum
    ['0h', '<2h', '2h à 4h', '4h à 6h', '>6h']
  end
  def activite_artistique_enum
    ['0h', '<2h', '2h à 4h', '4h à 6h', '>6h']
  end
        
  def consommation_de_fruit_enum
    ['Moins de 3 fois/semaine', 'Quotidienne', 'Plus de 3 fois/semaine']
  end
  def consommation_de_legume_enum
    ['Moins de 3 fois/semaine', 'Quotidienne', 'Plus de 3 fois/semaine']
  end
  def consommation_de_soda_enum
    ['Aucune', 'Occasionnelle', 'Frequente']
  end
  def grignotage_enum
    ['Aucun', 'Par faim', 'Par ennui', 'Devant la télé']
  end
  
  def contexte_des_repas_enum
    ['Seul', 'En Famille', 'Devant l\'écran', 'A table']
  end
  def demande_a_se_resservir_enum
    ['jamais', 'Occasionnallement', 'Souvent', 'Tout le temps']
  end
  def se_ressert_enum
    ['jamais', 'Occasionnallement', 'Souvent', 'Tout le temps']
  end
  def rythme_d_ingestion_enum
    ['Lent', 'Normal', 'Rapide']
  end
  
  def representation_des_repas_selon_l_enfant_enum
    ['Partage/convivialité', 'Stress/Conflit/Tension', 'Besoin physiologique']
  end
  def representation_des_repas_selon_les_parents_enum
    ['Partage/convivialité', 'Stress/Conflit/Tension', 'Besoin physiologique']
  end
end
