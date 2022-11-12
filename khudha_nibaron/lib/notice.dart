import 'package:flutter/material.dart';
import 'package:khudha_nibaron/dialogs.dart';
import 'package:khudha_nibaron/motamot.dart';
import 'home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'profile.dart';

class notice extends StatefulWidget {

  @override
  State<notice> createState() => _noticeState();
}

class _noticeState extends State<notice> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'নোটিশ',
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('নোটিশ').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                ),
                color: Colors.green,
                elevation: 20,
                child: ExpansionTile(
                  leading: Icon(Icons.info),
                  title: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('বিষয় : ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),),
                      Text(document['বিষয়'], style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),),
                    ],
                  )),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('তারিখ : ', style: TextStyle(fontSize: 18),),
                                    Text(document['তারিখ'], style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(child: Center(child: Text(document['বিবরণ'], style: TextStyle(fontSize: 18),textAlign: TextAlign.center,))),
                            ],
                          )),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}


