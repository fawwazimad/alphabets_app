import 'package:alphabets_app/database_helper.dart';
import 'package:alphabets_app/database_helper2.dart';
import 'package:alphabets_app/models/alphabet.dart';
import 'package:alphabets_app/models/user.dart';
import 'package:alphabets_app/sign_in_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<User> users;
  late List<Alphabet> alphabets;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshAlphabets();
    refreshUsers();
  }

  @override
  void dispose() {
    DatabaseHelper.instance.close();
    DatabaseHelper2.instance.close();
    super.dispose();
  }

  Future addUser() async {
    const user = User(
        idd: 1,
        namee: "Fawwaz",
        email: "Fawwaz@gmail.com",
        password: "12345",
        birthdate: '05-05-1999');
    await DatabaseHelper.instance.insertUser(user);
  }

  Future addAlphabet() async {
    List<Alphabet> alphabets = [
      Alphabet(arabicalpha: 'F', wordexample: 'Fruit'),
      Alphabet(arabicalpha: 'a', wordexample: 'Apple'),
      Alphabet(arabicalpha: 'w', wordexample: 'Window'),
      Alphabet(arabicalpha: 'a', wordexample: 'Airplane'),
      Alphabet(arabicalpha: 'z', wordexample: 'Zoo'),
      Alphabet(arabicalpha: 'b', wordexample: 'Banana'),
      Alphabet(arabicalpha: 'c', wordexample: 'Car'),
      Alphabet(arabicalpha: 'd', wordexample: 'Door'),
    ];
    for (int i = 0; i < alphabets.length; i++) {
      await DatabaseHelper2.instance.insertAlphabet(alphabets[i]);
    }
  }

  Future refreshUsers() async {
    setState(() => isLoading = true);

    users = await DatabaseHelper.instance.getUsers();

    setState(() => isLoading = false);
  }

  Future refreshAlphabets() async {
    setState(() => isLoading = true);
    alphabets = await DatabaseHelper2.instance.getAlphabets();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    addAlphabet();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Alphabets App")),
      ),
      body: isLoading
          ? const CircularProgressIndicator()
          : users.isEmpty
              ? const Center(
                  child: Text(
                    'No Users Or Alphabets',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                )
              : buildContent(),
    );
  }

  Widget buildContent() {
    Map<String, String> alphabetMap = {};
    String letters = users[0].namee;
    final letterss = letters.split('');
    for (int i = 0; i < alphabets.length; i++) {
      alphabetMap[alphabets[i].arabicalpha] = alphabets[i].wordexample;
    }

    List<GestureDetector> cards = <GestureDetector>[
      for (int i = 0; i < letters.length; i++)
        GestureDetector(
          onTap: () => {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
            ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(
                padding: const EdgeInsets.all(20),
                content: Text(alphabetMap[letterss[i]].toString()),
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
            )
          },
          child: Card(
              child: Center(
                  child:
                      Text(letters[i], style: const TextStyle(fontSize: 50)))),
        ),
    ];
    refreshUsers();
    refreshAlphabets();
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
              children: cards,
            )),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () { Navigator.of(context).push(MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => const SignInPage()));},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
          child: const Text('Logout'),
        ),
      ]),
    );
  }

  Card buildNameCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          users[0].namee,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Card buildEmailCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          users[0].email,
          style: const TextStyle(fontSize: 20),
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
          '22',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
