class DomainsController < ApplicationController

  before_action :set_domain, only: [:show, :edit, :update, :destroy]



  #Listing Approved and Unapproved Domains

  def index
    @domains = Domain.where(:role=>1)
    @domain = Domain.where(:role=>0)
  end


  #Change from one status to another (for Domains)
  def show
    @page=Domain.find params[:id]
    @p=@page.role
    case @p
      when 0
        @page.update(:role=>1)
      when 1
        @page.update(:role=>0)
      end
      redirect_to :action=>"index"

  end



   #Create a new domain

  def new
    @domain = Domain.new
  end
  def edit
  end
  def create
    @domain = Domain.new(domain_params)
     if @domain.save
         redirect_to :action=>"index"
         flash[:notice] = "Successfully created.." 
      else
         redirect_to :action=>"new"
         flash[:notice] = "Invalid domain name" 
      end
  end


  #Option to update existing domains

  def update
      if @domain.update(domain_params)
          redirect_to :action=>"index"
          flash[:notice] = "Successfully updated.."
      else
          redirect_to :action=>"edit"
          flash[:notice] = "Invalid domain name"
      end
  end

  #Delete the existing domain
  
  def destroy
    @domain.destroy
    redirect_to domains_url
    flash[:notice] = "Deleted successfully"
  end

  private
    def set_domain
      @domain = Domain.find(params[:id])
    end

    def domain_params
      params.require(:domain).permit(:d_name, :role)
    end
end
