class Admin::AdminsController < AdminController
  before_action :set_admin, only: %i[edit update destroy]
  def index
    @admins = Admin.order(id: :asc)
  end

  # Apenas monta o form
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    begin
      if @admin.save
        redirect_to admin_admins_path
      else
        render :new
      end
    rescue StandartError => e
      render json: { message: e.message }
    end
  end

  # Apenas monta o form
  def edit
  end

  def update
    # Transforma o admin_params em hash para salvar no registro do bd
    admin_param = admin_params.to_h

    # Desobriga de preencher password e password_confirmation
    admin_param = admin_param.except(:password, :password_confirmation) if params[:password].blank?

    if @admin.update(admin_param)
      redirect_to admin_admins_path
    else
      render :edit
    end
  end

  def destroy
    @admin.destroy
    redirect_to admin_admins_path
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
