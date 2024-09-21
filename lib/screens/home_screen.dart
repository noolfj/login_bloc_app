import 'package:flutter/material.dart';
import 'profile_screen.dart'; // Импортируй ProfileScreen
import 'products_screen.dart'; // Импортируй ProductsScreen, если он существует
import 'lists_screen.dart';    // Импортируй ListsScreen, если он существует

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Главное меню')),
    ProductsScreen(), // Заменить на свой экран товаров
    ListsScreen(),    // Заменить на свой экран списков
    ProfileScreen(),  // Теперь здесь будет экран профиля с API
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главное меню',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Товары',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Списки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black, // Цвет для невыбранных элементов
        backgroundColor: Colors.grey.shade300, // Цвет фона навигации
        onTap: _onItemTapped,
      ),
    );
  }
}
