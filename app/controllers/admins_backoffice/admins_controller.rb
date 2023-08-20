class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :verify_password, only: [:update]
  before_action :set_admin, only: [:update, :edit, :destroy]

  def index
    @admins = Admin.all.page(params[:page]).per(5)
  end

  def edit
  end

  def new 
    @admin = Admin.new
  end

  def create
    @admin = Admin.create(params_admin)
    if @admin.save()
      redirect_to admins_backoffice_admins_path, notice: "Administrador cadastrado com sucesso!"
    else
      render :edit
    end
  end

  def update    
    if @admin.update(params_admin)
      redirect_to admins_backoffice_admins_path, notice: "Administrador atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    email = @admin.email
    if @admin.destroy
      redirect_to admins_backoffice_admins_path, notice: "Administrador #{email} deletado com sucesso!"
    else
      render :index
    end
  end

  private

  def params_admin
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def verify_password
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].extract!(:password, :password_confirmation)
    end
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
