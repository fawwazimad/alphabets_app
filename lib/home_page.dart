import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Alphabets App")),
      ),
      body: Center(child: buildContent()),
    );
  }

  List<String> alphabets = <String>[('F'), ('A'), ('W'), ('W'), ('A'), ('Z')];

  Widget buildContent() {
    return SingleChildScrollView(
      child: Column(children: [
        buildNameCard(),
        const SizedBox(height: 10),
        buildEmailCard(),
        const SizedBox(height: 10),
        buildAgeCard(),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.count(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: 5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: <Widget>[
              GestureDetector(
                onTap: () => ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    padding: const EdgeInsets.all(20),
                    content: const Text('A'),
                    leading: const Icon(Icons.sort_by_alpha),
                    backgroundColor: Colors.green,
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => ScaffoldMessenger.of(context)
                            .hideCurrentMaterialBanner(),
                        child: const Text('DISMISS'),
                      ),
                    ],
                  ),
                ),
                child: const Card(
                    child: Center(
                        child: Text('A', style: TextStyle(fontSize: 50)))),
              ),
              const Card(
                  child:
                      Center(child: Text('A', style: TextStyle(fontSize: 50)))),
              const Card(
                  child:
                      Center(child: Text('A', style: TextStyle(fontSize: 50)))),
              const Card(
                  child:
                      Center(child: Text('A', style: TextStyle(fontSize: 50)))),
              const Card(
                  child:
                      Center(child: Text('A', style: TextStyle(fontSize: 50)))),
              const Card(
                  child:
                      Center(child: Text('A', style: TextStyle(fontSize: 50)))),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
          child: const Text("Logout"),
        ),
      ]),
    );
  }

  Card buildNameCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          "Your Name",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Card buildEmailCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          "Your Email",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Card buildAgeCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          "Your Age",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
