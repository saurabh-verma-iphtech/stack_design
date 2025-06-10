// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:stack_design/screens/User/LoginPage.dart';
// import 'package:stack_design/screens/User/profile.dart';
// import 'package:stack_design/screens/User/settings.dart';
// import 'package:stack_design/screens/about.dart';
// import 'package:stack_design/screens/contact.dart';
// import 'package:stack_design/screens/movies.dart';
// import 'package:stack_design/screens/services.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// final GoRouter _router = GoRouter(
//   initialLocation: '/LoginPage',
//   routes: [
//     GoRoute(
//       path: '/',
//       builder:
//           (context, state) => MyHomePage() // Your current widget with nav bar
//     ),
//     // GoRoute(path: 'LoginPage',builder: (context, state) => Login(),),
//     GoRoute(path: '/about', builder: (context, state) => AboutPage()),
//     GoRoute(path: '/contact', builder: (context, state) => ContactUs()),
//     GoRoute(path: '/services', builder: (context, state) => Services()),
//     GoRoute(path: '/profile', builder: (context, state) => UserProfile()),
//     GoRoute(path: '/settings', builder: (context, state) => Settings()),
//     GoRoute(path: '/LoginPage', builder: (context, state) => Login()),
//   ],
// );

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerConfig: _router,
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   // MyHomePage({super.key, required this.title});
//   // final String title;
//   List<dynamic> lists = [];

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;

//   final List<String> _routes = ['/', '/services', '/contact', '/about'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amberAccent,
//         title: Column(
//           children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 45.0),
//                   child: Text(
//                     'MoviesHub',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 5),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               // mainAxisSize: MainAxisSize.min,
//               children: [
//                 GestureDetector(
//                   onTap: () => context.go('/'),
//                   child: Text(
//                     "Home",
//                     style: TextStyle(
//                       // fontWeight: FontWeight.bold,
//                       // decoration: TextDecoration.underline,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () => context.go('/about'),
//                   child: Text(
//                     "About",
//                     style: TextStyle(
//                       // fontWeight: FontWeight.bold,
//                       // decoration: TextDecoration.underline,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),

//                 GestureDetector(
//                   onTap: () => context.go('/services'),
//                   child: Text(
//                     'Services',
//                     style: TextStyle(
//                       // fontWeight: FontWeight.bold,
//                       // decoration: TextDecoration.underline,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () => context.go('/contact'),
//                   child: Text(
//                     'Contact Us',
//                     style: TextStyle(
//                       // fontWeight: FontWeight.bold,
//                       // decoration: TextDecoration.underline,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         leading: Builder(
//           builder: (context) {
//             return Padding(
//               padding: const EdgeInsets.only(top: 25.0),
//               child: IconButton(
//                 icon: Icon(Icons.menu_sharp),
//                 onPressed: () {
//                   Scaffold.of(context).openDrawer();
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//       drawer: SizedBox(
//         width: 250,
//         child: Drawer(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: [
//               SizedBox(
//                 height: 200,
//                 child: DrawerHeader(
//                   margin: EdgeInsets.zero,
//                   decoration: BoxDecoration(color: Colors.blueAccent),
//                   child: Column(
//                     children: [
//                       CircleAvatar(
//                         radius: 35,
//                         foregroundImage: AssetImage('assets/images/myPic.jpg'),
//                       ),
//                       SizedBox(height: 10),
//                       Text('MoviesHub'),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 400,
//                 // color: Colors.amber,
//                 child: Column(
//                   children: [
//                     Flexible(
//                       child: ListView.separated(
//                         itemCount: 4, // Number of items
//                         separatorBuilder:
//                             (context, index) => Divider(
//                               height: 1,
//                               thickness: 2,
//                             ), // Divider between items
//                         itemBuilder: (context, index) {
//                           List<Map<String, dynamic>> menuItems = [
//                             {
//                               'title': 'Home',
//                               'icon': Icons.home,
//                               'route': '/',
//                             },
//                             {
//                               'title': 'Profile',
//                               'icon': Icons.person,
//                               'route': '/profile',
//                             },
//                             {
//                               'title': 'Settings',
//                               'icon': Icons.settings,
//                               'route': '/settings',
//                             },
//                             {
//                               'title': 'Logout',
//                               'icon': Icons.logout_sharp,
//                               'route': '/LoginPage',
//                             },
//                           ];

//                           return ListTile(
//                             leading: Icon(menuItems[index]['icon']),
//                             title: Text(menuItems[index]['title']),
//                             onTap: () {
//                               Navigator.pop(context); // Closes the drawer
//                               context.push(menuItems[index]['route']);
//                               // print('${titles[index]} tapped');
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(236, 64, 180, 200),
//               ),
//             ),
//           ),

//           // Most Bottom Layer
//           Padding(
//             padding: EdgeInsets.only(top: 0, left: 15, right: 15),
//             child: Column(
//               children: [
//                 SizedBox(height: 10),
//                 SizedBox(
//                   height: 35,
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Search...',
//                       hintStyle: TextStyle(
//                         // color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),

//                       prefixIcon: Icon(Icons.search, color: Colors.black),
//                       filled: true,
//                       fillColor: const Color.fromARGB(
//                         223,
//                         255,
//                         255,
//                         255,
//                       ).withOpacity(0.8),
//                       contentPadding: EdgeInsets.symmetric(
//                         vertical: 0,
//                         horizontal: 10,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   "CATEGORIES",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     decoration: TextDecoration.underline,
//                     fontSize: 20,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Second Layer(Container)
//           Positioned(
//             top: 90,
//             left: 0,
//             bottom: 0,
//             right: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 13, 99, 211),

//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(18),
//                   topRight: Radius.circular(18),
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         InkWell(
//                           onTap:
//                               () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder:
//                                       (_) => GenreMoviesPage(
//                                         genreId: 27,
//                                         genreName: 'Horror',
//                                       ),
//                                 ),
//                               ),
//                           child: Text(
//                             "HORROR",
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           'Scaring Movies',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,

//                       children: [
//                         InkWell(
//                           onTap:
//                               () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder:
//                                       (_) => GenreMoviesPage(
//                                         genreId: 28,
//                                         genreName: 'Action',
//                                       ),
//                                 ),
//                               ),
//                           child: Text(
//                             "Action",
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           'Acting Movies',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // Third Layer(Container)
//           Positioned(
//             top: 170,
//             left: 0,
//             bottom: 0,
//             right: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(218, 202, 61, 220),

//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(18),
//                   topRight: Radius.circular(18),
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         InkWell(
//                           onTap:
//                               () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder:
//                                       (_) => GenreMoviesPage(
//                                         genreId: 18,
//                                         genreName: 'Drama',
//                                       ),
//                                 ),
//                               ),
//                           child: Text(
//                             "DRAMA",
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           'Dramatical Movies',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,

//                       children: [
//                         InkWell(
//                           onTap:
//                               () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder:
//                                       (_) => GenreMoviesPage(
//                                         genreId: 14,
//                                         genreName: 'Fantasy',
//                                       ),
//                                 ),
//                               ),
//                           child: Text(
//                             "FANTASY",
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           'Fantasy Movies',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // Fourth Layer(Container)
//           Positioned(
//             top: 250,
//             left: 0,
//             bottom: 0,
//             right: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(218, 91, 41, 239),

//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(18),
//                   topRight: Radius.circular(18),
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         InkWell(
//                           onTap:
//                               () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder:
//                                       (_) => GenreMoviesPage(
//                                         genreId: 12,
//                                         genreName: 'Adventure',
//                                       ),
//                                 ),
//                               ),
//                           child: Text(
//                             "ADVENTURE",
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           'Adventurous Movies',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,

//                       children: [
//                         InkWell(
//                           onTap:
//                               () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder:
//                                       (_) => GenreMoviesPage(
//                                         genreId: 16,
//                                         genreName: 'Animation',
//                                       ),
//                                 ),
//                               ),
//                           child: Text(
//                             "ANIMATION",
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           'Animation Movies',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // Fifth Layer(Container)
//           Positioned(
//             top: 330,
//             left: 0,
//             bottom: 0,
//             right: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 39, 171, 188),

//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(18),
//                   topRight: Radius.circular(18),
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         InkWell(
//                           onTap:
//                               () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder:
//                                       (_) => GenreMoviesPage(
//                                         genreId: 10749,
//                                         genreName: 'Romance',
//                                       ),
//                                 ),
//                               ),
//                           child: Text(
//                             "ROMANCE",
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           'Romantic Movies',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,

//                       children: [
//                         InkWell(
//                           onTap:
//                               () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder:
//                                       (_) => GenreMoviesPage(
//                                         genreId: 35,
//                                         genreName: 'Comedy',
//                                       ),
//                                 ),
//                               ),
//                           child: Text(
//                             "COMEDY",
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           'Comedy Movies',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // Sixth Layer(Container)
//           Positioned(
//             top: 420,
//             left: 0,
//             bottom: 0,
//             right: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 215, 172, 0),

//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(18),
//                   topRight: Radius.circular(18),
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             InkWell(
//                               onTap:
//                                   () => Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder:
//                                           (_) => GenreMoviesPage(
//                                             genreId: 53,
//                                             genreName: 'Thriller',
//                                           ),
//                                     ),
//                                   ),
//                               child: Text(
//                                 "THRILLER",
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               'Thrillered Movies',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,

//                           children: [
//                             InkWell(
//                               onTap:
//                                   () => Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder:
//                                           (_) => GenreMoviesPage(
//                                             genreId: 80,
//                                             genreName: 'Crime',
//                                           ),
//                                     ),
//                                   ),
//                               child: Text(
//                                 "CRIME",
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               'Criminal Movies',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: const Color.fromARGB(255, 245, 244, 244),
//         // selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
//         unselectedItemColor: const Color.fromARGB(179, 12, 12, 12),
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//           context.go(_routes[index]);
//         },

//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Services'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.contact_mail),
//             label: 'Contact',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movies_hub/screens/User/LoginPage.dart';
import 'package:movies_hub/screens/User/profile.dart';
import 'package:movies_hub/screens/User/settings.dart';
import 'package:movies_hub/screens/about.dart';
import 'package:movies_hub/screens/contact.dart';
import 'package:movies_hub/screens/movies.dart';
import 'package:movies_hub/screens/services.dart';
import 'firebase_options.dart';
import 'package:flutter_animate/flutter_animate.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/LoginPage',
  routes: [
    GoRoute(
      path: '/',
      builder:
          (context, state) => MyHomePage(), // Your current widget with nav bar
    ),
    // GoRoute(path: 'LoginPage',builder: (context, state) => Login(),),
    GoRoute(path: '/about', builder: (context, state) => AboutPage()),
    GoRoute(path: '/contact', builder: (context, state) => ContactUs()),
    GoRoute(path: '/services', builder: (context, state) => Services()),
    GoRoute(path: '/profile', builder: (context, state) => UserProfile()),
    GoRoute(path: '/settings', builder: (context, state) => Settings()),
    GoRoute(path: '/LoginPage', builder: (context, state) => Login()),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'MoviesHub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({super.key, required this.title});
  // final String title;
  List<dynamic> lists = [];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  final List<String> _routes = ['/', '/services', '/contact', '/about'];
  late AnimationController _appBarTitleController;
  late AnimationController _searchController;
  late Animation<double> _titleAnimation;
  late Animation<double> _searchAnimation;

  @override
  void initState() {
    super.initState();

    _appBarTitleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _searchController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _titleAnimation = CurvedAnimation(
      parent: _appBarTitleController,
      curve: Curves.easeOutBack,
    );

    _searchAnimation = CurvedAnimation(
      parent: _searchController,
      curve: Curves.easeInOut,
    );

    _appBarTitleController.forward();
    Future.delayed(
      Duration(milliseconds: 300),
      () => _searchController.forward(),
    );
  }

  @override
  void dispose() {
    _appBarTitleController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 209, 209, 209),
        elevation: 0,
        title: ScaleTransition(
          scale: _titleAnimation,
          child: Text(
            'MoviesHub',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colors.primary.withOpacity(0.9),
                colors.secondary.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu_sharp,color: Colors.black,),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: _buildDrawer(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colors.primaryContainer,
              colors.background,
              colors.surface,
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: kToolbarHeight + 20),
            // FadeTransition(
            //   opacity: _searchAnimation,
            //   child: SlideTransition(
            //     position: Tween<Offset>(
            //       begin: Offset(0, -0.5),
            //       end: Offset.zero,
            //     ).animate(_searchAnimation),
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //       child: Material(
            //         elevation: 8,
            //         borderRadius: BorderRadius.circular(30),
            //         child: TextField(
            //           decoration: InputDecoration(
            //             hintText: 'Search movies...',
            //             prefixIcon: Icon(Icons.search, color: colors.primary),
            //             filled: true,
            //             fillColor: colors.surface,
            //             contentPadding: EdgeInsets.symmetric(
            //               vertical: 0,
            //               horizontal: 20,
            //             ),
            //             border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(30),
            //               borderSide: BorderSide.none,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: 20),
            Expanded(child: _buildCategoryGrid()),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Drawer(
      width: 280,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colors.primary.withOpacity(0.9),
              colors.secondary.withOpacity(0.9),
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 250,
              child: DrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: colors.surface,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: colors.onSurface,
                      ),
                    ).animate().scale(duration: 600.ms).shake(),
                    SizedBox(height: 15),
                    Text(
                      'MoviesHub',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colors.onPrimary,
                      ),
                    ).animate().fadeIn().slideY(),
                  ],
                ),
              ),
            ),
            ..._buildDrawerItems(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDrawerItems() {
    final menuItems = [
      {'title': 'Home', 'icon': Icons.home, 'route': '/'},
      {'title': 'Profile', 'icon': Icons.person, 'route': '/profile'},
      {'title': 'Settings', 'icon': Icons.settings, 'route': '/settings'},
      {'title': 'Logout', 'icon': Icons.logout_sharp, 'route': '/LoginPage'},
    ];

    return menuItems.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;

      return ListTile(
            leading: Icon(item['icon'] as IconData, color: Colors.white),
            title: Text(
              item['title'] as String,
              style: const TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              context.push(item['route'] as String);
            },
          )
          .animate(delay: (index * 100).ms)
          .fadeIn() // now fade in
          .slideX(begin: -1, end: 0);
    }).toList();
  }

  Widget _buildCategoryGrid() {
    final categories = [
      {
        'id': 27,
        'name': 'Horror',
        'desc': 'Scaring Movies',
        'color': Colors.deepPurple,
      },
      {
        'id': 28,
        'name': 'Action',
        'desc': 'Action Movies',
        'color': Colors.red,
      },
      {
        'id': 18,
        'name': 'Drama',
        'desc': 'Dramatical Movies',
        'color': Colors.blue,
      },
      {
        'id': 14,
        'name': 'Fantasy',
        'desc': 'Fantasy Movies',
        'color': Colors.green,
      },
      {
        'id': 12,
        'name': 'Adventure',
        'desc': 'Adventurous Movies',
        'color': Colors.orange,
      },
      {
        'id': 16,
        'name': 'Animation',
        'desc': 'Animation Movies',
        'color': Colors.pink,
      },
      {
        'id': 10749,
        'name': 'Romance',
        'desc': 'Romantic Movies',
        'color': Colors.purple,
      },
      {
        'id': 35,
        'name': 'Comedy',
        'desc': 'Comedy Movies',
        'color': Colors.yellow,
      },
      {
        'id': 53,
        'name': 'Thriller',
        'desc': 'Thrillered Movies',
        'color': Colors.teal,
      },
      {
        'id': 80,
        'name': 'Crime',
        'desc': 'Criminal Movies',
        'color': Colors.indigo,
      },
    ];

    return GridView.builder(
      padding: EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.2,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return _CategoryCard(
          genreId: category['id'] as int,
          genreName: category['name'] as String,
          description: category['desc'] as String,
          color: category['color'] as Color,
          index: index,
        );
      },
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(
        context,
      ).colorScheme.onSurface.withOpacity(0.6),
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() => _selectedIndex = index);
        context.go(_routes[index]);
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Services'),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_mail),
          label: 'Contact',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
      ],
    ).animate().moveY(duration: 500.ms, curve: Curves.easeOut, begin: 100);
  }
}

class _CategoryCard extends StatefulWidget {
  final int genreId;
  final String genreName;
  final String description;
  final Color color;
  final int index;

  const _CategoryCard({
    required this.genreId,
    required this.genreName,
    required this.description,
    required this.color,
    required this.index,
  });

  @override
  State<_CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<_CategoryCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => GenreMoviesPage(
                      genreId: widget.genreId,
                      genreName: widget.genreName,
                    ),
              ),
            ),
        child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              transform: Matrix4.identity()..scale(_isHovering ? 1.03 : 1.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    widget.color.withOpacity(0.8),
                    widget.color.withOpacity(0.5),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(_isHovering ? 0.4 : 0.2),
                    blurRadius: _isHovering ? 15 : 8,
                    offset: Offset(0, _isHovering ? 5 : 3),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                        GenreMoviesPage(genreId: widget.genreId, genreName: widget.genreName),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.genreName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 5,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          widget.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .animate(delay: (widget.index * 80).ms)
            .fadeIn()
            .slideY(begin: 0.2, curve: Curves.easeOutBack),
      ),
    );
  }
}
