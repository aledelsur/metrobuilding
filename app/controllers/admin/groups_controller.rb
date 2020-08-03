class Admin::GroupsController < AdminController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = @project.groups.all
  end

  def show
  end

  def new
    @group = @project.groups.new
  end

  def create
    @group = @project.groups.new(group_params)
    @group.save
    redirect_to admin_groups_path
  end

  def edit
  end

  def update
    @group.update(group_params)
    redirect_to admin_groups_path
  end

  def destroy
    @group.destroy
    flash[:success] = "Grupo eliminado correctamente."
    redirect_to admin_groups_path
  end

  def users
    group = Group.find(params[:group_id])
    @group_users = group.users

    @users_to_add = User.where.not(id: group.users.select(:id))
  end

  def add_user
    group = Group.find(params[:group_id])
    user = User.find(params[:id])

    group.users << user
    redirect_to admin_group_users_path
  end

  def remove_user
    group = Group.find(params[:group_id])
    user = User.find(params[:id])

    group.users.delete(user)
    redirect_to admin_group_users_path
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :project_id)
  end

end
