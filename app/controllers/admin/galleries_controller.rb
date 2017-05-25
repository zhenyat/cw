class Admin::GalleriesController < Admin::BaseController
  before_action :set_gallery, only: [:show, :edit, :update,:destroy]
  after_action  :remove_images_dir, only: :destroy

  def index
    @galleries = policy_scope(Gallery)
  end

  def show
    authorize @gallery
  end

  def new
    @gallery = Gallery.new
    authorize @gallery
  end

  def edit
    authorize @gallery
  end

  def create
    @gallery = Gallery.new(gallery_params)
    authorize @gallery
    if @gallery.save
      flash[:success] = t('messages.created', model: @gallery.class.model_name.human)
      redirect_to [:admin, @gallery]
    else      
      render :new
    end
  end

  def update
    authorize @gallery
    if @gallery.update(gallery_params)
      flash[:success] = t('messages.updated', model: @gallery.class.model_name.human)
      redirect_to [:admin, @gallery]
    else      
      render :edit
    end
  end

  def destroy
    authorize @gallery
    @gallery.destroy
    flash[:success] = t('messages.deleted', model: @gallery.class.model_name.human)
    redirect_to admin_galleries_path
  end

  private

    # Removes upload images directory of a destroyed Gallery
    def remove_images_dir
      if @gallery.images.present?
        dir = File.dirname(@gallery.images.first.current_path)
        FileUtils.remove_dir dir if Dir.empty?(dir)
      end
    end
    
    # Uses callbacks to share common setup or constraints between actions
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Only allows a trusted parameter 'white list' through
    def gallery_params
      params.require(:gallery).permit(:name, :title, :images, :position, :status, {images: []})
    end
end
