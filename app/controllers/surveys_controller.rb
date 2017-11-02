class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def edit
    @survey = Survey.find_by_id(params[:id])
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to edit_survey_path(@survey)
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def survey_params
    params.require(:survey).permit!
  end
end
