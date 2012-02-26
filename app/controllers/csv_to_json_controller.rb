class CsvToJsonController < ApplicationController
  def show
    @q_id = params[:id]
    @q_sid = params[:sid]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @questionnaire }
    end
  end
end
