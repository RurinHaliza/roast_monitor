import 'package:flutter/material.dart';

import '../pages/history_page.dart';
import '../pages/monitor_page.dart';
import '../pages/settings_page.dart';
import '../pages/statistic_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {

  int currentIndex = 0;

  final List<Widget> pages = const [

    MonitorPage(),
    HistoryPage(),
    StatisticPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: pages[currentIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
            ),
          ],
        ),

        child: BottomNavigationBar(

          currentIndex: currentIndex,

          onTap: (index) {

            setState(() {
              currentIndex = index;
            });
          },

          type: BottomNavigationBarType.fixed,

          selectedItemColor: const Color(0xFF5B3521),
          unselectedItemColor: Colors.grey,

          backgroundColor: Colors.white,

          items: const [

            BottomNavigationBarItem(
              icon: Icon(Icons.speed),
              label: 'Monitor',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Riwayat',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Statistik',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Pengaturan',
            ),
          ],
        ),
      ),
    );
  }
}