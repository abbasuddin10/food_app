import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khudha_nibaron/dialogs.dart';
import 'package:khudha_nibaron/motamot.dart';
import 'package:khudha_nibaron/notice.dart';
import 'package:khudha_nibaron/profile.dart';
import 'home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ditecaiform extends StatefulWidget {

  const ditecaiform({Key? key}) : super(key: key);

  @override
  State<ditecaiform> createState() => _ditecaiformState();
}

class _ditecaiformState extends State<ditecaiform> {

  Future sendData() async {
    final dataBase = FirebaseFirestore.instance.collection("খাবার দিতে চায়");
    return dataBase.doc().set({
      "নাম": _name.text,
      "মোবাইল নাম্বার": _mobileNumber.text,
      "জেলার নাম": _zillaName.text,
      "উপজেলার নাম": _upojelaName.text,
      "পোষ্ট কোড": _postcode.text,
      "ইউনিয়ন": _eunionName.text,
      "গ্রাম": _gramName.text,
      "কত জনের খাবার দিতে চায়": _humanNumber.text,
      "মতামত": _motamot.text,
    });
  }

  TextEditingController _name = new TextEditingController();
  TextEditingController _mobileNumber = new TextEditingController();
  TextEditingController _zillaName = new TextEditingController();
  TextEditingController _upojelaName = new TextEditingController();
  TextEditingController _postcode = new TextEditingController();
  TextEditingController _eunionName = new TextEditingController();
  TextEditingController _gramName = new TextEditingController();
  TextEditingController _humanNumber = new TextEditingController();
  TextEditingController _motamot = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'খাবার দিতে চাই',
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
              height: 425,
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
                                return 'জেলার নাম লিখুন';
                              }
                              return null;
                            },
                            controller: _zillaName,
                            keyboardType: TextInputType.text,
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: 'জেলার নাম',
                              prefixIcon: Icon(Icons.location_on_outlined),
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
                                return 'উপজেলার নাম লিখুন';
                              }
                              return null;
                            },
                            controller: _upojelaName,
                            keyboardType: TextInputType.text,
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: 'উপজেলার নাম',
                              prefixIcon: Icon(Icons.location_on_outlined),
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

                          SizedBox(height: 10,),
                          TextFormField(
                            controller: _postcode,
                            keyboardType: TextInputType.number,
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: 'পোষ্ট কোড',
                              prefixIcon: Icon(Icons.location_on_outlined),
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
                            controller: _eunionName,
                            keyboardType: TextInputType.text,
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: 'ইউনিয়নের নাম',
                              prefixIcon: Icon(Icons.location_on_outlined),
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
                                return 'গ্রামের নাম লিখুন';
                              }
                              return null;
                            },
                            controller: _gramName,
                            keyboardType: TextInputType.text,
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: 'গ্রামের নাম',
                              prefixIcon: Icon(Icons.home),
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
                                return 'কতজনের খাবার দিতে চান সেটি লিখুন';
                              }
                              return null;
                            },
                            controller: _humanNumber,
                            keyboardType: TextInputType.number,
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: 'কতজনের খাবার দিতে চান',
                              prefixIcon: Icon(Icons.how_to_reg),
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
                            controller: _motamot,
                            keyboardType: TextInputType.text,
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: 'আপনার মতামত দিন',
                              prefixIcon: Icon(Icons.mail),
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
                            height: 15,
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
                                      content: Text('ফর্ম পূরণ করার জন্য আপনাকে ধন্যবাদ'),
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
