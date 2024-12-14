import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          widget._navigationShell.goBranch(index);
          setState(() {});
        },
        currentIndex: widget._navigationShell.currentIndex,
        backgroundColor: Colors.transparent,
        elevation: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Anan',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Anan'),
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
