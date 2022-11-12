import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khudha_nibaron/dialogs.dart';
import 'package:khudha_nibaron/notice.dart';
import 'package:khudha_nibaron/profile.dart';
import 'home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class motamot extends StatefulWidget {

  const motamot({Key? key}) : super(key: key);

  @override
  State<motamot> createState() => _motamotState();
}

class _motamotState extends State<motamot> {

  Future sendData() async {
    final dataBase = FirebaseFirestore.instance.collection("বেবহারকারীর মতামত");
    return dataBase.doc().set({
      "নাম": _name.text,
      "মোবাইল নাম্বার": _mobileNumber.text,
      "মতামত": _motamot.text,
    });
  }

  TextEditingController _name = new TextEditingController();
  TextEditingController _mobileNumber = new TextEditingController();
  TextEditingController _motamot = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'আপনার মতামত দিন',
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
                Navigator.of(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.green),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          // SizedBox(
          //   height: 80,
          // ),
          Image.asset(
            'assets/images/appLogo.png',
            height: 100,
            width: 100,
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Text(
            'ক্ষুধা নিবারণ',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 505,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('আপনার যদি অ্যাপ সম্পর্কে কিছু বলার প্রয়োজন হয় তাহলে এখানে বলতে পারেন', style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                          SizedBox(height: 15,),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'আপনার নাম লিখুন';
                              }
                              return null;
                            },
                            controller: _name,
                            keyboardType: TextInputType.text,
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: 'আপনার নাম',
                              prefixIcon: Icon(Icons.person),
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(
                                    color: Colors.indigoAccent, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: Colors.indigoAccent, width: 2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'আপনার মোবাইল নাম্বারটি লিখুন';
                              }
                              return null;
                            },
                            controller: _mobileNumber,
                            keyboardType: TextInputType.phone,
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: 'আপনার মোবাইল নাম্বার',
                              prefixIcon: Icon(Icons.phone),
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(
                                    color: Colors.indigoAccent, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: Colors.indigoAccent, width: 2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'আপনার মতামত লিখুন';
                              }
                              return null;
                            },
                            controller: _motamot,
                            keyboardType: TextInputType.text,
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: 'আপনার মতামত লিখুন',
                              //prefixIcon: Icon(Icons.location_on_outlined),
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(
                                    color: Colors.indigoAccent, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: Colors.indigoAccent, width: 2),
                              ),
                            ),
                            maxLines: 5,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  sendData();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => home(),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('আপনার গুরুত্বপূর্ণ মতামত দেওয়ার জন্য ধন্যবাদ'),
                                    ),
                                  );
                                }

                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.indigoAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                elevation: 7.0,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'সাবমিট করুন',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
