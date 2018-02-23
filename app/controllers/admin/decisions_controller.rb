class Admin::DecisionsController < AuthenticatedAdminController
  def new
    @split = Split.find params[:split_id]
    @decision = Decision.new
  end

  def create
    split = Split.find params[:split_id]
    split_decision = Decision.new(split: split, variant: target_variant, admin: current_admin)
    unless split_decision.save
      flash[:error] = 'There was an issue deciding this split.'
    end
    redirect_to [:admin, split]
  end

  private

  def target_variant
    params.require(:decision).permit(:variant).fetch(:variant)
  end
end
