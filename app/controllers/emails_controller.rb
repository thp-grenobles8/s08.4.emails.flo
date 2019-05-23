class EmailsController < ApplicationController
  def index
    @emails = Email.all.order(id: :asc)
  end

  def show
    @email = Email.find(params[:id])
    @email.update(:read => true)
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end
  end

  def edit
    @email = Email.find(params[:id])
    read = @email.read
    @email.update(:read => !read)
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end
  end

  def create
    @email = Email.create(object: Faker::Lorem.sentence(5), body: Faker::Lorem.sentence(50))
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end
  end
end
