class Admin::AccountsController < Admin::BaseController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  after_action  :remove_avatar_dir, only: :destroy
  
  def index
    @accounts = policy_scope(Account)
  end

  def show
    authorize @account
  end

  def new
    @account = Account.new
    authorize @account
  end

  def edit
    authorize @account
  end

  def create
    @account = Account.new(account_params)
    authorize @account
    if @account.save
      flash[:success] = t('messages.created', model: @account.class.model_name.human)
      redirect_to [:admin, @account]
    else      
      render :new
    end
  end

  def update
    authorize @account
    if @account.update(account_params)
      flash[:success] = t('messages.updated', model: @account.class.model_name.human)
      redirect_to [:admin, @account]
    else      
      render :edit
    end
  end

  def destroy
    authorize @account
    @account.destroy
    flash[:success] = t('messages.deleted', model: @account.class.model_name.human)
    redirect_to admin_accounts_path
  end

  private

    # Removes upload avatar directory of a destroyed Account
    def remove_avatar_dir
      dir = File.dirname(@account.avatar.current_path)
      FileUtils.remove_dir dir if Dir.empty?(dir)
    end
    
    # Uses callbacks to share common setup or constraints between actions
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allows a trusted parameter 'white list' through
    def account_params
      params.require(:account).permit(:name, :avatar, :position, :status, :remove_avatar)
    end
end
