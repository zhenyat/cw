class Admin::ResumesController < Admin::BaseController
  before_action :set_resume, only: :destroy
  after_action  :remove_attachement_dir, only: :destroy

  def index
    @resumes = policy_scope(Resume)
  end

  def new
    @resume = Resume.new
    authorize @resume
  end

  def create
    @resume = Resume.new(resume_params)
    authorize @resume
    if @resume.save
      flash[:success] = "The resume #{@resume.name} has been uploaded."
      redirect_to admin_resumes_path
    else      
      render :new
    end
  end

  def destroy
    authorize @resume
    @resume.destroy
    flash[:success] = "The resume #{@resume.name} has been deleted."
    redirect_to admin_resumes_path
  end

  private

    # Removes upload attachement directory of a destroyed Resume
    def remove_attachement_dir
      dir = File.dirname(@resume.attachment.current_path)
      FileUtils.remove_dir dir if Dir.empty?(dir)
    end

    # Uses callbacks to share common setup or constraints between actions
    def set_resume
      @resume = Resume.find(params[:id])
    end

    # Only allows a trusted parameter 'white list' through
    def resume_params
      params.require(:resume).permit(:name, :attachment)
    end
end
