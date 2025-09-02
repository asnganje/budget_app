class GroupsController < ApplicationController
  def new
    @group = Group.new
    render turbo_stream: turbo_stream.update("modal", partial: "groups/modal_form")
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace(
            "groups",
            partial: "groups/groups",
            locals: { groups: Group.includes(:operations).order(:name) }
          ),
          turbo_stream.update("modal", "")
        ]
        end
        format.html { redirect_to dashboard_path, notice: "Category created successfully" }
      end
    else
    render turbo_stream: turbo_stream.replace(
      "groups",
      partial: "groups/group", locals: { group: @group }), status: :unprocessable_entity
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
