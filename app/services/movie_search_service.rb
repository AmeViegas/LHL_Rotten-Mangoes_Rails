class MovieSearchService

  def self.search(params)
    movies = Movie
    movies = movies.with_title("%#{params[:title]}%") unless params[:title].blank?
    movies = movies.with_director("%#{params[:director]}%") unless params[:director].blank?
    movies = movies.order("title ASC")
  end

end
