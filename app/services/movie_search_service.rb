class MovieSearchService

  def self.search(params)
    movies = Movie
    movies = movies.with_title("%#{params[:title]}%") unless params[:title].blank?
    movies = movies.with_director("%#{params[:director]}%") unless params[:director].blank?
    movies = movies.short if params[:movie_len] == "short"
    movies = movies.medium if params[:movie_len] == "medium"
    movies = movies.long if params[:movie_len] == "long"
    movies = movies.order("title ASC")
  end

end
