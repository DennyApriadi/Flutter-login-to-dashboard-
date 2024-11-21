import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                  title: Text("HELLO DENI APRIADI".toUpperCase(), style: Theme.of(context).textTheme.headlineSmall?.copyWith(
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
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 1,
                children: const [
                  Center(child: Text("Halaman Profile", style: TextStyle(fontSize: 20,),)),
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