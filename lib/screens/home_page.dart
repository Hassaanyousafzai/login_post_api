import 'package:flutter/material.dart';
import 'package:login_post_api/screens/join_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "Home View",
            style: TextStyle(fontSize: 25),
          ),
        ),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  "HOME PAGE",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Do you want to\nLog Out?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Join()));
              },
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.amber[300],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                    child: Text(
                  "Log Out",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.w500),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
