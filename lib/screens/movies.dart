import 'package:flutter/material.dart';
import 'package:stack_design/services/movieService.dart';

class GenreMoviesPage extends StatefulWidget {
  final int genreId;
  final String genreName;

  const GenreMoviesPage({
    super.key,
    required this.genreId,
    required this.genreName,
  });

  @override
  State<GenreMoviesPage> createState() => _GenreMoviesPageState();
}

class _GenreMoviesPageState extends State<GenreMoviesPage> {
  List<dynamic> movies = [];
  final MovieService movieService = MovieService();

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  void fetchMovies() async {
    final fetchedMovies = await movieService.fetchMoviesByGener(widget.genreId);
    setState(() {
      movies = fetchedMovies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.genreName} Movies',style: TextStyle(fontWeight: FontWeight.bold),),backgroundColor: Color.fromARGB(255, 209, 209, 209),
      ),
      body:
          movies.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        movie['poster_path'] != null
                            ? Container(
                              width: 120, // Large poster width
                              height: 180, // Large poster height
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w300${movie['poster_path']}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                            : Container(
                              width: 120,
                              height: 180,
                              color: Colors.grey,
                              child: Icon(Icons.movie, size: 50),
                            ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie['title'] ?? 'No title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  movie['overview'] ?? 'No overview',
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );

                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(height: 10, thickness: 2);
                },
              ),
    );
  }
}
