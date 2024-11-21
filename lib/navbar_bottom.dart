import 'package:flutter/material.dart';
import 'package:lgoin_flutter/home_page.dart';
import 'package:lgoin_flutter/shop_page.dart';
import 'package:lgoin_flutter/profile_page.dart'; 

class NavbarBottom extends StatefulWidget {
  final String nama; 
  const NavbarBottom({super.key, required this.nama});

  @override
  State<NavbarBottom> createState() => _NavbarBottomState();
}

class _NavbarBottomState extends State<NavbarBottom> {
  int myCurrentIndex = 0;
  List<Widget> myPages = [];

  @override
  void initState() {
    super.initState();
    myPages = [
      MyHomePage(nama: widget.nama), 
      ShopPage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 25,
              offset: const Offset(8, 20),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Color(0xFFa56e2d),
            unselectedItemColor: Colors.black,
            currentIndex: myCurrentIndex,
            onTap: (index) {
              setState(() {
                myCurrentIndex = index; 
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.browse_gallery),
                label: "Gallery",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: "Shop",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
      body: myPages[myCurrentIndex],
    );
  }
}
