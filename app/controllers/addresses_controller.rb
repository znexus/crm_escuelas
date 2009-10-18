class AddressesController < ApplicationController
  layout false
  # GET /addresss
  # GET /addresss.xml
  def index
    @addresses = Address.find(:all,
     :conditions => ["addressable_type=? and addressable_id=?",params[:addressable_type],params[:addressable_id]])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @addresses }
    end
  end

  # GET /addresss/1
  # GET /addresss/1.xml
  def show
    @address = Address.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresss/new
  # GET /addresss/new.xml
  def new
    @address = Address.new
    #debo pasarle los parametros del objeto con dirección
    @address.addressable_type = params[:addressable_type]
    @address.addressable_id = params[:addressable_id]
    
    @address.country ||= Country.find_by_alpha_2_code("PE")
    @regions = @address.country.regions
    @countries = Country.find(:all, :order => "name ASC")
    
    respond_to do |format|
      format.html { render :action => "edit" }# new.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresss/1/edit
  def edit
    @address = Address.find(params[:id])
    
    @address.country ||= Country.find_by_alpha_2_code("PE")
    @regions = @address.country.regions
    @countries = Country.find(:all, :order => "name ASC")
    
    #render :layout=>false
  end

  # POST /addresss
  # POST /addresss.xml
  def create
    @address = Address.new(params[:address])
    type = @address.addressable_type
    id = @address.addressable_id
    respond_to do |format|
      if @address.save
        flash[:notice] = 'Address was successfully created.'
        format.html { redirect_to(addresses_path({:addressable_type=>type, :addressable_id=>id})) }
        format.xml  { render :xml => @address, :status => :created, :location => @address }
      else

        @address.country ||= Country.find_by_alpha_2_code("PE")
        @regions = @address.country.regions
        @countries = Country.find(:all, :order => "name ASC")       
        
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /addresss/1
  # PUT /addresss/1.xml
  def update
    @address = Address.find(params[:id])
    type = @address.addressable_type
    id = @address.addressable_id
    respond_to do |format|
      if @address.update_attributes(params[:address])
        flash[:notice] = 'Address was successfully updated.'
        format.html { redirect_to(addresses_path ({:addressable_type=>type, :addressable_id=>id}) ) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /addresss/1
  # DELETE /addresss/1.xml
  def destroy
    @address = Address.find(params[:id])
    type = @address.addressable_type
    id = @address.addressable_id
    @address.destroy

    respond_to do |format|
      format.html { redirect_to( addresses_path({:addressable_type=>type, :addressable_id=>id}) ) }
      format.xml  { head :ok }
    end
  end
  
  def regions_in_country
    @country = Country.find(params[:id]) 
    @country ||= Country.find_by_alpha_2_code("PE")
    render :partial=>"regions", :locals=>{ :regions=>@country.regions, :address=>Address.new }
  end
  
end
