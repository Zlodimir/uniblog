class Admin::CommentsController < Admin::BaseController
  	def destroy
  		@comment = Comment.find(params[:id])
  		@comment.destroy

	  	#respond_to do |format|
	  		#if @comment.destroy
	  		#	format.js { render js: nil, status: :ok }
	  			#format.html { 
	  				#flash[:notice] = "Комментарий удален"
	  			#}
	      		
	      	#else
	  		#	format.html { 
	  		#		flash.now[:alert] = "Комментарий не удален"
	  		#	}
	  		#	format.js{}
	      	#end
	    #end
  	end
end
