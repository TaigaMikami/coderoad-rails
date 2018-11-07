class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      render action: 'confirm'
    else
      render action: 'new'
    end
  end

  def complete
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save

    else

    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
