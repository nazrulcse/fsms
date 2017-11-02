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
        format.html { redirect_to work_orders_path, notice: 'Work Order was successfully created.' }
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
        if params[:work_order][:technician_id].present?
          if @work_order.status == 'Created'
            @work_order.status = 'Assigned'
            @work_order.save
          end
        end
        if params['image'].present?
          params['image'].each do |a|
            Attachment.create(attachmentable_id: @work_order.id, attachmentable_type: @work_order.class, attachment: a)
          end
        end
        format.html { redirect_to work_orders_path, notice: 'Work Order was successfully Updated.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    @work_order = WorkOrder.find_by_id(params[:id])
    respond_to do |format|
      if @work_order.destroy
        format.html { redirect_to work_orders_path, notice: 'Work Order was successfully deleted.' }
      else
        format.html { redirect_to work_orders_path, notice: 'Somethng Worng Try Again' }
      end
    end
  end

  def show
    @work_order = WorkOrder.find_by_id(params[:id])
  end

  def assign_user
    @work_order = WorkOrder.find_by_id(params[:id])
  end


  private

  def work_order_params
    params.require(:work_order).permit!
  end
end
