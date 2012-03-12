class ProfilsController < ApplicationController
  
  def subscriptions_graph
    days = (params[:days] || 30).to_i
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: {
        :type => 'AreaChart',
        :cols => [['string', 'Date'], ['number', 'subscriptions'], ['number', 'purchases']],
        :rows => (1..days).to_a.inject([]) do |memo, i|
           date = i.days.ago.to_date
           t0, t1 = date.beginning_of_day, date.end_of_day
           subscriptions = Subscription.where(:created_at.gte => t0, :created_at.lte => t1).count
           purchases = Purchase.where(:purchased_at.gte => t0, :purchased_at.lte => t1).count
           memo << [date, subscriptions, purchases]
           memo
        end.reverse,
        :options => {
          :chartArea => { :width => '90%', :height => '75%' },
          :hAxis => { :showTextEvery => 30 },
          :legend => 'bottom',
        }
      }}
    end
    
  end
  
  # GET /profils
  # GET /profils.json
  def index
    @profils = Profil.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profils }
    end
  end

  # GET /profils/1
  # GET /profils/1.json
  def show
    @profil = Profil.find(params[:id])
    @categories = Category.find(:all)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profil }
    end
  end

  # GET /profils/new
  # GET /profils/new.json
  def new
    @profil = Profil.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profil }
    end
  end

  # GET /profils/1/edit
  def edit
    @profil = Profil.find(params[:id])
  end

  # POST /profils
  # POST /profils.json
  def create
    @profil = Profil.new(params[:profil])

    respond_to do |format|
      if @profil.save
        format.html { redirect_to @profil, notice: 'Profil was successfully created.' }
        format.json { render json: @profil, status: :created, location: @profil }
      else
        format.html { render action: "new" }
        format.json { render json: @profil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profils/1
  # PUT /profils/1.json
  def update
    @profil = Profil.find(params[:id])

    respond_to do |format|
      if @profil.update_attributes(params[:profil])
        format.html { redirect_to @profil, notice: 'Profil was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profils/1
  # DELETE /profils/1.json
  def destroy
    @profil = Profil.find(params[:id])
    @profil.destroy

    respond_to do |format|
      format.html { redirect_to profils_url }
      format.json { head :no_content }
    end
  end
end
