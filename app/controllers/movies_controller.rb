class MoviesController < ApplicationController
  # GET /movies
  # GET /movies.xml
  def index
    @movies = Movie.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @movies }
    end
  end

def vote
    filme1=Movie.find(params[:id1])
    filme1.update_attributes({:rating => filme1.rating+1})
    filme2=Movie.find(params[:id2])
    filme2.update_attributes({:rating => filme2.rating-1})
    
    redirect_to :action => :home
  end
  
  # GET /
  def home
    if Movie.all.size>=2
      @randmovies = Movie.all.sort_by {rand}[0..1]
    else
      @randmovies=nil
    end
    @movies = Movie.order('rating DESC').limit(10)

    respond_to do |format|
      format.html # home.html.erb
      format.xml  { render :xml => @randmovies }
    end
  end


  # GET /movies/1
  # GET /movies/1.xml
  def show
    @movie = Movie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @movie }
    end
  end

  # GET /movies/new
  # GET /movies/new.xml
  def new
    @movie = Movie.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @movie }
    end
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /movies
  # POST /movies.xml
  def create
    @movie = Movie.new({:name => params[:movie][:name], :rating => 0})

    respond_to do |format|
      if @movie.save
        format.html { redirect_to(@movie, :notice => 'Movie was successfully created.') }
        format.xml  { render :xml => @movie, :status => :created, :location => @movie }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @movie.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.xml
  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to(@movie, :notice => 'Movie was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @movie.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.xml
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to(movies_url) }
      format.xml  { head :ok }
    end
  end
  
  
end
