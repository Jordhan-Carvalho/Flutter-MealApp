// import 'package:flutter/material.dart';

// import './favorites_screen.dart';
// import './categories_screen.dart';

// class TabsNav extends StatefulWidget {
//   @override
//   _TabsNavState createState() => _TabsNavState();
// }

// class _TabsNavState extends State<TabsNav> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       // initialIndex: 1,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meals APP'),
//           bottom: TabBar(
//             tabs: <Widget>[
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Categories',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'Favorites',
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: <Widget>[
//             CategoriesScreen(),
//             FavoritesScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }
