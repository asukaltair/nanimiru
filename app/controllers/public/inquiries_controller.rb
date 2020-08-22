class Public::InquiriesController < ApplicationController

	def new
		@inquiry = Inquiry.new
	end

	def create
		@inquiry = Inquiry.create(inquiry_params)
		@inquiry.name = params[:inquiry][:name]
		@inquiry.mail = params[:inquiry][:mail]
		@inquiry.message = params[:inquiry][:message]
		if @inquiry.save
			InquiryMailer.send_mail(@inquiry).deliver
			redirect_to contact_finish_path
		end
	end

	def finish
	end

	private

	def inquiry_params
		params.permit(:name, :mail, :message)
	end

end
