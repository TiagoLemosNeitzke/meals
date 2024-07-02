import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  final List<Map<String, Object>> _screens = [
    {
      'title': 'Lista de Categorias',
      'screen': const CategoriesScreen(),
    },
    {
      'title': 'Meus Favoritos',
      'screen': const FavoriteScreen(),
    },
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  // o código abaixo implementa a navegação por tabs na parte superior da tela
  /*Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 1, // isso é utilizado para definir qual é a aba inicial
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vamos Cozinhar?'),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favoritos',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen(),
          ],
        ),
      ),
    );
  }*/
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title'] as String),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      drawer: Drawer(
        child: MainDrawer()
      ),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).hintColor,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
