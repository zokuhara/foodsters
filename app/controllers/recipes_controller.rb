class RecipesController < ApplicationController
  require 'icalendar'

  before_action :authenticate_user!
  # also authenticate subscription

  def index

  end

  def show
    @result = Yummly.find params[:id]
  end

  def search
    # Plan B: We become the destination of clicking
    # the 'Search' link in the header
    q = params[:q]
    @results = Yummly.search(q)
  end

  def new
    @result = Yummly.find params[:id]
    @recipe = Recipe.new
    @recipe.summary = @result.name
    @recipe.description = "#{@result.ingredients.join("\n")}\n----------------"
  end

  def create
    @recipe = Recipe.new params.require(:recipe).permit(:summary, :description, :dtstart)
    if @recipe.save
      export_event
    else
      render :new
    end
  end

  def export_event
    @calendar = Icalendar::Calendar.new
    cal_event = Icalendar::Event.new
    cal_event.dtstart = @recipe.dtstart
    cal_event.summary = @recipe.summary
    cal_event.description = @recipe.description
    @calendar.add_event cal_event
    @calendar.publish
    respond_to do |format|
      format.ics do
        response.headers['Content-Disposition'] = 'attachment; filename="' + filename + '.ics"'

        render :text => @calendar.to_ical
      end
    end
    # headers['Content-Type'] = "text/calendar; charset=UTF-8"
    # render :text => (@calendar.to_ical + ".ics")
  end

end
