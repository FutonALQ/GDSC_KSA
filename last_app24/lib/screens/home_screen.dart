import 'package:flutter/material.dart';
import 'package:last_app24/data/movies_data.dart';
import 'package:last_app24/models/movie_model.dart';
import 'package:last_app24/screens/detail_screen.dart';
import 'package:last_app24/screens/favorite_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Movies> listmovies;
  Set<Movies> favoriteMovies = {};

  void toggleFavorite(Movies movie) {
    setState(() {
      if (favoriteMovies.contains(movie)) {
        favoriteMovies.remove(movie);
      } else {
        favoriteMovies.add(movie);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    listmovies = dataList.map((json) => Movies.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4EEE0),
      appBar: AppBar(
        actions: [
          InkWell(
            child: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FavoriteScreen(favoriteMovies: favoriteMovies.toList()),
                ),
              );
            },
          )
        ],
        backgroundColor: Color(0xFFF4EEE0),
        title: Text(
          'Movies',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: listmovies.length,
        itemBuilder: (context, index) {
          final movie = listmovies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(movie: movie),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    movie.image!,
                    height: 300,
                    width: double.infinity,
                  ),
                  SizedBox(height: 3),
                  Center(
                    child: Text(
                      movie.title!,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: favoriteMovies.contains(movie)
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(Icons.favorite_border),
                    onPressed: () {
                      toggleFavorite(movie);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
