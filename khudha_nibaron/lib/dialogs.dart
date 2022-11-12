import 'package:flutter/material.dart';
import 'package:khudha_nibaron/khabarditecay.dart';
import 'package:khudha_nibaron/khabarnitecay.dart';
import 'package:khudha_nibaron/motamot.dart';
import 'package:khudha_nibaron/notice.dart';
import 'package:khudha_nibaron/profile.dart';
import 'home.dart';


class dialogueBox extends StatefulWidget {
  const dialogueBox({Key? key}) : super(key: key);

  @override
  State<dialogueBox> createState() => _dialogueBoxState();
}

class _dialogueBoxState extends State<dialogueBox> {
  int _selectedIndex = 1;

  final List<Widget> _widgetOptions = <Widget>[
    khabarDiteCaiList(),
    extendHome(),
    khabarnitecayList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_outlined),
            label: 'খাবার দিতে চায়',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'হোম',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.no_food),
            label: 'খাবার নিতে চায়',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}


class extendHome extends StatefulWidget {
  const extendHome({Key? key}) : super(key: key);

  @override
  State<extendHome> createState() => _extendHomeState();
}

class _extendHomeState extends State<extendHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'ক্ষুধা নিবারণ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => notice(),
                  ));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: SizedBox(
                child: Text(
                  "ক্ষুধা নিবারণ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black),
                ),
              ),
              accountEmail: SizedBox(
                height: 10,
                child: Text(
                  "",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/appLogo.png"),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                /*image: DecorationImage(
                  image: AssetImage("images/10188.png"),
                  opacity: 100,
                  fit: BoxFit.cover,
                ),*/
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('হোম'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const home(),
                  ),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.build),
              title: Text('Developer'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profile(),
                  ),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.perm_device_information),
              title: Text('অ্যাপ সম্পর্কে'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => dialogueBox(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('শেয়ার করুন'),
              onTap: () {
                Navigator.of(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.comment),
              title: Text('আপনার মতামত দিন'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => motamot(),
                    ));
              },
            ),
          ],
        ),
      ),
      body: AlertDialog(
        title: Text('আমাদের অ্যাপ সম্পর্কে'),           // To display the title it is optional
        content: Text('আমাদের এই অ্যাপটি মানুষের খাদ্য অপচয় রোধ করবে এবং সমাজে যারা ঠিক মত খেতে পায় না তাদেরকে খাওয়ার ব্যাবস্থা করে দিবে।'),   // Message which will be pop up on the screen
        // Action widget which will provide the user to acknowledge the choice
        actions: [
          MaterialButton(
            textColor: Colors.black,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => home(),
                  ));
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

