# encoding: UTF-8
class PdfReport < Prawn::Document 
  def to_pdf(object)
    pdf = Prawn::Document.new
    object_class = object.class.name
    logo1 = "app/assets/rails_admin/images/logo.png"
    pdf.image logo1, :scale => 0.5, :position => :center,   :vposition => :top
    pdf.move_down 40
    case object_class
      when "Profil" then
        pdf.font("Helvetica", :size => 20)
        pdf.text "<b>Profil de " + object.name + "</b>", :inline_format => true
        pdf.move_down 20
        pdf.font("Helvetica", :size => 16)
        pdf.text "<b><u>Fiche d'identité</u></b>", :inline_format => true
        pdf.move_down 10
        pdf.font("Helvetica", :size => 12)
        
        if object.name.blank? then
          pdf.text "<b>Nom :</b> inconnu", :inline_format => true
        else
          pdf.text "<b>Nom :</b> " + object.name, :inline_format => true
        end
        
        if object.birthdate.blank? then
          pdf.text "<b>Né(e) le :</b> inconnu", :inline_format => true
        else 
          pdf.text "<b>Né(e) le :</b> " + I18n.localize(object.birthdate), :inline_format => true
        end
        
        if object.gender.blank? then
          pdf.text "<b>De sexe :</b> inconnu", :inline_format => true
        else
          pdf.text "<b>De sexe :</b> " + object.gender, :inline_format => true
        end
        
        pdf.move_down 20
        pdf.font("Helvetica", :size => 16)
        pdf.text "<b><u>Responsable légaux</u></b>", :inline_format => true
        pdf.move_down 10
        pdf.font("Helvetica", :size => 12)
        
        
        pdf.move_down 20
        pdf.font("Helvetica", :size => 16)
        pdf.text "<b><u>Établissement scolaire</u></b>", :inline_format => true
        pdf.move_down 10
        pdf.font("Helvetica", :size => 12)
        
        if object.school.blank? then
          pdf.text "<b>École fréquentée :</b> inconnu", :inline_format => true
        else
          pdf.text "<b>École fréquentée :</b> " + object.school.name, :inline_format => true
        end
        
        if object.classroom.blank? then
          pdf.text "<b>Classe :</b> inconnu", :inline_format => true
        else
          pdf.text "<b>Classe :</b> " + object.classroom, :inline_format => true
        end
        
        pdf.move_down 20
        pdf.font("Helvetica", :size => 16)
        pdf.text "<b><u>Encadrement</u></b>", :inline_format => true
        pdf.move_down 10
        pdf.font("Helvetica", :size => 12)
        
        if object.user.blank? then
          pdf.text "<b>Éducateur en charge :</b> inconnu", :inline_format => true
        else
          pdf.text "<b>Éducateur en charge :</b> " + object.user.name, :inline_format => true
        end
        
        
        if object.groupe_enfant.blank? then
          pdf.text "<b>Groupe de l'enfant :</b> inconnu", :inline_format => true
        else
          pdf.text "<b>Groupe de l'enfant :</b> " + object.groupe_enfant.name, :inline_format => true
        end
       
      when "Questionnaire" then
        pdf.font("Helvetica", :size => 20)
        pdf.text "<b>Questionnaire " + object.title + "</b>", :inline_format => true
        pdf.move_down 20
        pdf.font("Helvetica", :size => 16)
        pdf.text "<b>Résultats</b>", :inline_format => true
        pdf.move_down 10
        pdf.font("Helvetica", :size => 12)
        CSV.parse(object.content, :headers => true, :col_sep => ",") do |row|    
          row.to_hash.each do |key, value|
            pdf.text "<b>" + key.gsub("_"," ") + " :</b> " + value, :inline_format => true
          end
        end
          
      else
        pdf.text "<b>Non disponible...contacter Florian : florian.tobe@gmail.com !</b>", :inline_format => true
    end
    # footer
    pdf.page_count.times do |i|
      pdf.go_to_page(i+1)
      pdf.bounding_box([bounds.left, bounds.bottom + 25], :width => 500) {
        pdf.text "Association Réunir - http://www.reunir974.org - #{i+1} / #{page_count}", :align => :right
      }
    end
    pdf.render
  end 
end