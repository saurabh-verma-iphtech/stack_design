import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stack_design/screens/about.dart';
import 'package:stack_design/screens/contact.dart';
import 'package:stack_design/screens/movies.dart';
import 'package:stack_design/screens/services.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder:
          (context, state) => const MyHomePage(
            title: 'Working on Stack',
          ), // Your current widget with nav bar
    ),
    GoRoute(path: '/about', builder: (context, state) => AboutPage()),
    GoRoute(path: '/contact', builder: (context, state) => ContactUs()),
    GoRoute(path: '/services', builder: (context, state) => Services()),
  ],
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(236, 64, 180, 200),
              ),
            ),
          ),

          // Most Bottom Layer
          Padding(
            padding: EdgeInsets.only(top: 35, left: 15, right: 15),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 209, 209, 209),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => context.go('/'),
                          child: Text(
                            "Home",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.go('/about'),
                          child: Text(
                            "About",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.go('/contact'),
                          child: Text(
                            'Contact Us',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.go('/services'),
                          child: Text(
                            'Services',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 35,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        // color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),

                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      filled: true,
                      fillColor: const Color.fromARGB(
                        223,
                        255,
                        255,
                        255,
                      ).withOpacity(0.8),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "CATEGORIES",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          // Second Layer(Container)
          Positioned(
            top: 160,
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 13, 99, 211),

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => GenreMoviesPage(
                                        genreId: 27,
                                        genreName: 'Horror',
                                      ),
                                ),
                              ),
                          child: Text(
                            "HORROR",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'Scaring Movies',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        InkWell(
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => GenreMoviesPage(
                                        genreId: 28,
                                        genreName: 'Action',
                                      ),
                                ),
                              ),
                          child: Text(
                            "Action",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'Acting Movies',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Third Layer(Container)
          Positioned(
            top: 250,
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(218, 202, 61, 220),

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => GenreMoviesPage(
                                        genreId: 18,
                                        genreName: 'Drama',
                                      ),
                                ),
                              ),
                          child: Text(
                            "DRAMA",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'Dramatical Movies',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        InkWell(
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => GenreMoviesPage(
                                        genreId: 14,
                                        genreName: 'Fantasy',
                                      ),
                                ),
                              ),
                          child: Text(
                            "FANTASY",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'Fantasy Movies',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Fourth Layer(Container)
          Positioned(
            top: 350,
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(218, 91, 41, 239),

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => GenreMoviesPage(
                                        genreId: 12,
                                        genreName: 'Adventure',
                                      ),
                                ),
                              ),
                          child: Text(
                            "ADVENTURE",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'Adventurous Movies',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        InkWell(
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => GenreMoviesPage(
                                        genreId: 16,
                                        genreName: 'Animation',
                                      ),
                                ),
                              ),
                          child: Text(
                            "ANIMATION",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'Animation Movies',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Fifth Layer(Container)
          Positioned(
            top: 440,
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 39, 171, 188),

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => GenreMoviesPage(
                                        genreId: 10749,
                                        genreName: 'Romance',
                                      ),
                                ),
                              ),
                          child: Text(
                            "ROMANCE",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'Romantic Movies',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        InkWell(
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => GenreMoviesPage(
                                        genreId: 35,
                                        genreName: 'Comedy',
                                      ),
                                ),
                              ),
                          child: Text(
                            "COMEDY",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'Comedy Movies',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Sixth Layer(Container)
          Positioned(
            top: 527,
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 215, 172, 0),

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap:
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => GenreMoviesPage(
                                            genreId: 53,
                                            genreName: 'Thriller',
                                          ),
                                    ),
                                  ),
                              child: Text(
                                "THRILLER",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              'Thrillered Movies',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            InkWell(
                              onTap:
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => GenreMoviesPage(
                                            genreId: 80,
                                            genreName: 'Crime',
                                          ),
                                    ),
                                  ),
                              child: Text(
                                "CRIME",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              'Criminal Movies',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 245, 244, 244),
        // selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: const Color.fromARGB(179, 12, 12, 12),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Services'),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}
