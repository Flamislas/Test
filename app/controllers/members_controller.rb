class MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
  end

  def index
    if params[:search]
      @members = Member.search(params[:search])
      if @members.empty?
        @members = Member.all
        flash.alert = "Aucune recherche ne correspond à vos critères"
        render :index
      else
        @members
      end
    else
      @members = Member.all
    end
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
      if @member.save
        flash[:success] = "Member created"
        redirect_to members_path
    else
        flash[:alert] = "Creation failed"
        render "new"
    end
  end

  def edit
    @member = Member.find(params[:id])      
  end

  def update
    @member = Member.find(params[:id])

    update_params = params.require(:member).permit(:name, :last_name, :date, :id)

    if @member.update(update_params)
      flash.notice = "Member successfully edited"
      redirect_to root_path
    else
      flash.alert = "Can not be updated"
      render :edit
      flash.alert = nil
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to root_path
  end

  private

  def member_params
    params.permit(:name, :last_name, :date)
  end
end
