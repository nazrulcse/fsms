class ChecklistsController < ApplicationController
  def new
    @survey = Survey.find_by_id(params[:survey_id])
    @checklist = Checklist.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @error = ''
    survey = Survey.find_by_id(params[:survey_id])
    @checklist = survey.checklists.build(checklist_params)
    unless @checklist.save
      @error = @checklist.errors.first
    end
  end

  def edit
    @survey = Survey.find_by_id(params[:survey_id])
    @checklist = Checklist.find_by_id(params[:id])
  end

  def update
    @error = ''
    survey = Survey.find_by_id(params[:survey_id])
    @checklist = Checklist.find_by_id(params[:id])
    unless @checklist.update_attributes(checklist_params)
      @error = @checklist.errors.first
    end
  end

  def search

  end

  def destroy

  end

  private

  def checklist_params
    params.require(:checklist).permit!
  end
end
