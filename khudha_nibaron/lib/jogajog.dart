import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:khudha_nibaron/dialogs.dart';
import 'package:khudha_nibaron/motamot.dart';
import 'package:khudha_nibaron/notice.dart';
import 'package:khudha_nibaron/profile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';

class jogajog extends StatefulWidget {

  const jogajog({Key? key}) : super(key: key);


  @override
  State<jogajog> createState() => _jogajogState();

}


class _jogajogState extends State<jogajog> {
String alamin = "+8801996584456";
String abbas ="+8801883073202";
String mehedi ="+8801931588892";
String partho ="+8801319829086";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'যোগাযোগ করুন',
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
      body: SingleChildScrollView(
        child: Center(
          child:  Column(
            children: [
              Container(
                width: 310,
                height: 170,
                padding: new EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: CircleAvatar(

                          backgroundImage: AssetImage('assets/images/alamin.jpg'),

                        ),
                        title: Text(
                            'আলামিন আকন্দ',
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)
                        ),
                        subtitle: Text(
                            'গোসাইরহাট, শরীয়তপুর',
                            style: TextStyle(fontSize: 15.0)
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(

                            onPressed: () async {
                              await FlutterPhoneDirectCaller.callNumber(alamin);

                            },
                            child: Icon(Icons.call),
                            style: ElevatedButton.styleFrom(

                              shape: RoundedRectangleBorder(

                                borderRadius: BorderRadius.circular(100), // <-- Radius
                              ),
                            ),
                          )

                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 310,
                height: 170,
                padding: new EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: CircleAvatar(

                          backgroundImage: AssetImage('assets/images/abbas1.png'),

                        ),
                        title: Text(
                            'আব্বাস উদ্দিন',
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)
                        ),
                        subtitle: Text(
                            'নড়িয়া, শরীয়তপুর',
                            style: TextStyle(fontSize: 15.0)
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(

                            onPressed: () async {
                              await FlutterPhoneDirectCaller.callNumber(abbas);},
                            child: Icon(Icons.call),
                            style: ElevatedButton.styleFrom(

                              shape: RoundedRectangleBorder(

                                borderRadius: BorderRadius.circular(100), // <-- Radius
                              ),
                            ),
                          )

                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 310,
                height: 170,
                padding: new EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: CircleAvatar(

                          backgroundImage: AssetImage('assets/images/mehedi.jpg'),

                        ),
                        title: Text(
                            'মোঃ মেহেদি হাসান',
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)
                        ),
                        subtitle: Text(
                            'সদর, শরীয়তপুর',
                            style: TextStyle(fontSize: 15.0)
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(

                            onPressed: () async {
                              await FlutterPhoneDirectCaller.callNumber(mehedi);},
                            child: Icon(Icons.call),
                            style: ElevatedButton.styleFrom(

                              shape: RoundedRectangleBorder(

                                borderRadius: BorderRadius.circular(100), // <-- Radius
                              ),
                            ),
                          )

                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 310,
                height: 170,
                padding: new EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: CircleAvatar(

                          backgroundImage: AssetImage('assets/images/partho.jpg'),

                        ),
                        title: Text(
                            'পার্থ বড়াল',
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)
                        ),
                        subtitle: Text('কার্তিকপুর, শরীয়তপুর',
                            style: TextStyle(fontSize: 15.0)
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(

                            onPressed: () async {
                              await FlutterPhoneDirectCaller.callNumber(partho);},
                            child: Icon(Icons.call),
                            style: ElevatedButton.styleFrom(

                              shape: RoundedRectangleBorder(

                                borderRadius: BorderRadius.circular(100), // <-- Radius
                              ),
                            ),
                          )

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
