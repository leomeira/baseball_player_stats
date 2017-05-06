class StatsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json { render json: StatsDatatable.new(view_context) }
    end
  end

end
