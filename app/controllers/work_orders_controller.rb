class WorkOrdersController < ApplicationController

  def index
    @work_orders = WorkOrder.all
  end

  def new
    @work_order = WorkOrder.new
  end

  def create
    @work_order = WorkOrder.new(work_order_params)
    @work_order.status = 'Created'
    @work_order.creator = current_user
    respond_to do |format|
       if @work_order.save
         if params['image'].present?
           params['image'].each do |a|
             Attachment.create(attachmentable_id: @work_order.id, attachmentable_type: @work_order.class, attachment: a)
           end
         end
        format.html { redirect_to work_orders_path, notice: 'Post was successfully created.' }
      else
        format.html { render action: 'new' }
       end
    end
  end

  def edit
    @work_order = WorkOrder.find_by_id(params[:id])
  end

  def update
    @work_order = WorkOrder.find_by_id(params[:id])
    respond_to do |format|
      if @work_order.update_attributes(work_order_params)
        if params['image'].present?
          params['image'].each do |a|
            Attachment.create(attachmentable_id: @work_order.id, attachmentable_type: @work_order.class, attachment: a)
          end
        end
        format.html { redirect_to work_orders_path, notice: 'Post was successfully Updated.' }
      else
        format.html { render action: 'new' }
      end
    end
  end


  private

  def work_order_params
    params.require(:work_order).permit!
  end
end
