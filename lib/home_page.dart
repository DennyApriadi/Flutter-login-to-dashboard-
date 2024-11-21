import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  String nama;
  MyHomePage({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(
               color: Color(0xFF4e8b9d),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(80),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text("Hello $nama".toUpperCase(), style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Color(0xFFffffff), fontSize: 20,
                  )),
                  subtitle: Text("Welcome To App", style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Color(0xFFffffff), fontSize: 13,
                  )),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("images/person.png"),
                    backgroundColor: Color(0xFFa56e2d),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
             color: Color(0xFF4e8b9d),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80)
                )
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  ItemDashboard("Buku-1", "images/buku1.png"),
                  ItemDashboard("Buku-2", "images/buku2.png"),
                  ItemDashboard("Buku-3", "images/buku3.png"),
                  ItemDashboard("Buku-4", "images/buku4.png"),
                  ItemDashboard("Buku-5", "images/buku5.png"),
                  ItemDashboard("Buku-6", "images/buku6.png"),
                  ItemDashboard("Buku-7", "images/buku7.png"),
                  ItemDashboard("Buku-8", "images/buku8.png"),
                  ItemDashboard("Buku-9", "images/buku9.png"),
                  ItemDashboard("Buku-10", "images/buku10.png"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}

class ItemDashboard extends StatefulWidget {
  final String title;
  final String imagePath;

  ItemDashboard(this.title, this.imagePath);

  @override
  _ItemDashboardState createState() => _ItemDashboardState();
}

class _ItemDashboardState extends State<ItemDashboard> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;  // Toggle warna saat item di-tap
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),  // Durasi animasi
        curve: Curves.easeInOut,  // Jenis animasi
        decoration: BoxDecoration(
          color: isTapped ?Color(0xFF4e8b9d) : Colors.white,  // Warna berubah saat di-tap
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(0, 5),
              spreadRadius: 2,
              blurRadius: 5
            )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                widget.imagePath,
                width: 80,
                height: 80,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.title.toUpperCase(),
              style: TextStyle(
                color: isTapped ? Colors.white : Colors.black,  
              ),
            ),
          ],
        ),
      ),
    );
  }
}
