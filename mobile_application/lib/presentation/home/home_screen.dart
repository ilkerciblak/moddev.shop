import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_application/common/_common.dart';

final class HomeScreen extends StatefulWidget {
  final StatefulNavigationShell _navigationShell;
  const HomeScreen({
    super.key,
    required StatefulNavigationShell navigationShell,
  }) : _navigationShell = navigationShell;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget._navigationShell,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.shifting,
        onTap: (index) {
          widget._navigationShell.goBranch(index);
        },
        currentIndex: widget._navigationShell.currentIndex,
        backgroundColor: Colors.transparent,
        // fixedColor: Theme.of(context).scaffoldBackgroundColor,

        selectedItemColor: AppColors.primarySilver,

        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
            ),
            activeIcon: Icon(Icons.shopping_bag),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
            ),
            activeIcon: Icon(Icons.person_2),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Anan')
        ],
      ),
    );
  }
}
