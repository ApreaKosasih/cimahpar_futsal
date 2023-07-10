import 'package:cimahpar_futsal/screen/booking.dart';
import 'package:cimahpar_futsal/screen/home.dart';
import 'package:cimahpar_futsal/screen/profile.dart';
import 'package:cimahpar_futsal/screen/tiket.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key, this.indexno = 0});

  final int indexno;

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  //Ini contoh penerapan loading
  bool _loading = false;
  void _onLoading() {
    setState(() {
      _loading = true;
      Future.delayed(const Duration(seconds: 3), _loaded);
    });
  }

  Future _loaded() async {
    setState(() {
      _loading = false;
    });
  }

  //ini untuk bottom navigation bar
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //ini untuk list widget yang dipanggil berdasarkan index bottom navigation yang ditampilkan di body
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    BookingScreen(),
    TiketScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    _selectedIndex = widget.indexno;
    _onLoading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          //untuk widget loading bisa pakai CircularProgressIndicator() yang di bungkus oleh widget center biar posisi ada ditengah
          ? const Center(child: CircularProgressIndicator())
          : _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num),
            label: 'Tiket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
