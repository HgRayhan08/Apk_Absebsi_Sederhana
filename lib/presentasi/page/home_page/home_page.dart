import 'package:absensi/presentasi/page/home_absen_page/home_absen_page.dart';
import 'package:absensi/presentasi/page/list_absen_page/list_absen_page.dart';
import 'package:absensi/presentasi/provider/login_provider/user_data.dart';
import 'package:absensi/presentasi/provider/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeAbsenPage(),
    ListAbsenPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<bool?>>(
      userDataProvider,
      (previous, next) {
        next.when(
          data: (user) {
            if (user == false) {
              ref.read(routerProvider).goNamed("login");
            }
          },
          loading: () {},
          error: (error, stack) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.toString()),
              ),
            );
          },
        );
      },
    );

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: height * 0.1),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Keluar'),
              onTap: () {
                ref.read(userDataProvider.notifier).logout();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Absensi'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List Absen',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
