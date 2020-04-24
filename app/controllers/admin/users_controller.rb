class Admin::UsersController < AdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @budget = Budget.all
    @users = User.includes(:payments, properties: [:property_category, :debts])

    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save

        # Metromarketing::Users::Request.post(@user)

        flash[:success] = "Propietario creado correctamente."
        format.html { redirect_to admin_users_path }
        format.json { render :show, status: :created, location: @user }
      else
        flash[:error] = "Los siguientes errores no permiten guardar la información:"
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      result = if user_params[:password].present?
                 @user.update(user_params)
               else
                 @user.update_without_password(user_params)
               end
      if result

        # Metromarketing::Users::Request.put(@user)

        flash[:success] = "Propietario actualizado correctamente."
        format.html { redirect_to admin_users_path }
        format.json { render :show, status: :ok, location: @user }
      else
        flash[:error] = "Los siguientes errores no permiten guardar la información:"
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      flash[:success] = "Propietario eliminado correctamente."
      format.html { redirect_to admin_users_path }
      format.json { head :no_content }
    end
  end

  def newsletters_history
    @user = User.find(params[:user_id])
    @sent_newsletters = @user.sent_newsletters
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :dni, :cuit, :phone_number, :mobile_number, :address_1, :address_2, :notes)
  end
end
