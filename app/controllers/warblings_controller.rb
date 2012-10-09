class WarblingsController < ApplicationController

  before_filter :fetch_issues

	def index
	  
	end
	
	def show
	  @issue = Issue.find(params[:id])
	  # FriendlyID History
    if request.path != warbling_path(@issue)
      return redirect_to @issue, :status => :moved_permanently
    end
	  @stream = (@issue.trills.published + @issue.posts).sort_by(&:created_at).reverse
	end
	
	private 
	  def fetch_issues
	    @issues = Issue.all
	  end

end