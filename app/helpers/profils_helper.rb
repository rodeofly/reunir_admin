# encoding: UTF-8
module ProfilsHelper

  def mesure_linechart_data
    mesure_list = []
    taille = 0
    poids = 0
    taille = 0
    poids = 0
    tour_de_taille = 0
    tour_de_hanches = 0
    z_score = 0
    imc = 0
    
    @profil.profil_mesures.each do |mesure|
      taille = mesure.taille? ? taille : mesure.taille
      poids = mesure.poids? ? poids : mesure.poids
      tour_de_taille = mesure.tour_de_taille? ? tour_de_taille : mesure.tour_de_taille
      tour_de_hanches = mesure.tour_de_hanches? ? tour_de_hanches : mesure.tour_de_hanches
      z_score = mesure.z_score? ? z_score : mesure.z_score
      imc = mesure.imc? ? imc : mesure.imc
      puts "*************************"
      puts distance_of_time_in_words(@profil.birthdate,mesure.date_of_mesure,  {:locale => 'fr', :only => ["months", "years"]})
      puts "*************************" 
      mesure_list << [distance_of_time_in_words(@profil.birthdate,mesure.date_of_mesure, {:locale => 'fr', :only => ["months", "years"]}), taille, poids, tour_de_taille, tour_de_hanches, z_score, imc ]
    end
    return mesure_list
  end
    
end