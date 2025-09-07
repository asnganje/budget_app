class OperationsController < ApplicationController
  before_action :set_group, only: [ :new, :create ]
  def new
    @operation = @group.operations.new
    render turbo_stream: turbo_stream.update(
      "modal2",
      partial: "operations/modal_form",
      locals: { operation: @operation, group: @group }
    )
  end

  def create
    @operation = @group.operations.build(operations_params)
    @operation.author = current_user

    if @operation.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update(
              "operations",
              partial: "operations/operations",
              locals: { operations: @group.operations.order(created_at: :desc) }
            ),
            turbo_stream.update(
              "group-total",
              partial: "groups/total",
              locals: { group: @group }
            ),
            turbo_stream.update("modal2", "")
          ]
        end
      end
    else
        render turbo_stream: turbo_stream.replace(
          "modal2",
          partial: "operations/modal_form",
          locals: { operation: @operation, group: @group }
        ), status: :unprocessable_entity
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def operations_params
    params.require(:operation).permit(:name, :amount)
  end
end
