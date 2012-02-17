class Questionnaire < ActiveRecord::Base
  belongs_to :category
  belongs_to :profil
  #validates_presence_of :category
  
 
  def csvhash
     csv_hash = {}
     if !self.content.blank?
       CSV.parse(self.content, :headers => true, :col_sep => ",") do |row|
         row.to_hash.each do |key, value|
           csv_hash[key.underscore.to_sym] = value
         end
       end
     end
     return csv_hash
  end
  


  def title
    if (!self.category.blank? and !self.profil.blank?)
        return self.category.name + " - " + self.profil.name
    else
      return "inconnu"
    end  
  end
  
  def user
    if (!self.profil.blank?)
        return self.profil.user.name
    else
      return "inconnu"
    end  
  end
    
    #self.hash[:category].to_s+self.hash[:nom].to_s+self.hash[:prenom].to_s
#  end
#  def name
#    if :content
#      return self.content["category"].to_s + " " + self.content["nom_enfant"].to_s
#    else
#      return 'inconnu'
#    end
#  end
    
end

#####################################CSV TO HASH
#<% product = {} %>
#<% CSV.parse(questionnaire.content, :headers => true, :col_sep => ",") do |row| %>    
#  <% row.to_hash.each do |key, value| %> 
#    <% product[key.underscore.to_sym] = value %>
#  <% end %>
#<% end %>
#<%= product.to_s %>