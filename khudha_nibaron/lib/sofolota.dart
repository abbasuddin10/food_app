import 'package:flutter/material.dart';
import 'package:khudha_nibaron/dialogs.dart';
import 'package:khudha_nibaron/motamot.dart';
import 'package:khudha_nibaron/notice.dart';
import 'package:khudha_nibaron/profile.dart';

import 'home.dart';

class sofolota extends StatefulWidget {
  const sofolota({Key? key}) : super(key: key);

  @override
  State<sofolota> createState() => _sofolotaState();
}

class _sofolotaState extends State<sofolota> {
  var titleList = [
    "গোসাইরহাটে বন্যা",
    "মায়ের মুখে হাসি",
    "সেদিন কান্না করেছিল",
    "নুরুলের মুখে হাসি",
    "তাদের সাথে আমরা",
    "আমরা করিমগঞ্জে",
    "আহা তার কি আনন্দ!",
    "তাদের সাথে আমরা",
  ];

  // Description List Here
  var descList = [
    "শাহজালাল উপশহর এলাকায় নৌকা ট্রাকে তুলে বাঁধছিলেন নাজির উদ্দিন নামের এক ব্যক্তি। তিনি বলেন, বন্যার কারণে সিলেটের বিয়ানীবাজার উপজেলা থেকে তিনটি নৌকা নিয়ে এসেছিলেন। এখন পানি কমে যাওয়ায় সরিয়ে নিচ্ছেন। তবে পানি বেড়ে গেলে আবার নৌকা নিয়ে আসবেন। ",
    "নৌকাগুলো দিয়ে স্বেচ্ছাসেবীরা মানুষ সরিয়ে নেওয়া এবং খাবার পৌঁছে দেওয়ার কাজ করেছেন বলে জানান তিনি। নগরের মির্জাজাঙ্গাল ও দাড়িয়াপাড়ায়ও পানি কিছুটা কমেছে। তবে ছড়াসংলগ্ন বাসাবাড়িগুলোয় পানি এখনো রয়ে গেছে।",
    "ত্রাণ বিতরণের সময় কোমরপানি ভেঙে নৌকার কাছে আসেন হাতিয়ার এলাকার বাসিন্দা বিমলা রায় (৫৮)। খাদ্যসহায়তা পেয়ে তিনি বলেন, ‘তোমার খাবার গুইলা পায়া খুব উপকার হইলো বাহে। কয়েক দিন থাকি পানির মধ্যে পড়ি আছং। কাই খাবার দেয় নায়।’",
    "একই এলাকার সফিকুল ইসলাম বলেন, ‘হঠাৎ করি বানের পানি আসি সউগ তলে গেইল। তাতে বৃষ্টি। এক সপ্তাহ থাকি পানিত পড়ি আছি। কাইয়ো কিছু দেয় নাই। তোমার খাবার গুইলা পায়া উপকার হইলো।’",
    "প্রধান অতিথির বক্তৃতায় রুহুল কুদ্দুস তালুকদার আরও বলেন, সিলেটের মানুষ যখন ত্রাণের জন্য হাহাকার করছেন, তখন সরকার শতকোটি টাকা খরচ করে পদ্মা সেতু উদ্বোধনের নামে আনন্দ-উৎসবে ব্যস্ত। ব্যয় করা এই টাকা যদি বন্যার্ত মানুকে দেওয়া হতো, তাহলে দুর্ভোগ কিছুটা হলেও কমত।",
    "গোকর্ণঘাট অংশে পানির বিপৎসীমা ৫ দশমিক ৩৩ মিটার, বর্তমানে পানি আছে ৪ দশমিক ৯৫ মিটার এবং রোববার ছিল ৪ দশমিক ৩৮ মিটার। তিতাসের নবীনগর অংশে পানির বিপৎসীমার নিচে রয়েছে। তিতাসের আজবপুর অংশে বর্তমানে পানি আছে ৫ দশমিক ৫৫ মিটার, যা বিপৎসীমার ৯ সেন্টিমিটার ওপরে। রোববার এখানে পানি ছিল ৫ দশমিক শূন্য ৫ মিটার।",
    "ব্রাহ্মণবাড়িয়া শহরসহ এর আশপাশের এলাকায় পানি বৃদ্ধি অব্যাহত রয়েছে। ব্রাহ্মণবাড়িয়ায় তিতাস নদের এন্ডারসন খাল ও আজবপুর পয়েন্টে পানি যথাক্রমে বিপৎসীমার ২৯ ও ৯ সেন্টিমিটার ওপরে রয়েছে। গত ২৪ ঘণ্টায় জেলার গোকর্ণঘাট, আখাউড়া ও গঙ্গাসাগর পয়েন্টে পানি ২ থেকে ৪ সেন্টিমিটার বেড়েছে।",
    "উঠানে এখনো হাঁটুপানি। ঘরের ভেতরের সবকিছু তছনছ হয়ে গেছে। পানিতে ভিজে আছে সব আসবাব। বিছানাপত্র সব ভেজা। বৃষ্টি ও জয়ার সব বইপত্রও পানিতে নষ্ট হয়েছে। এক সপ্তাহ এগুলো পানির নিচে ছিল। দুই বোন উঠান থেকে পানি নিয়ে ঘরের মেঝে, আসবাব ধুয়েমুছে পরিষ্কার করছিলেন।",
  ];

  // Image Name List Here
  var imgList = [
    "assets/images/sofol1.jpg",
    "assets/images/sofol2.jpg",
    "assets/images/sofol3.jpg",
    "assets/images/sofol2.jpg",
    "assets/images/sofol1.jpg",
    "assets/images/sofol3.jpg",
    "assets/images/sofol1.jpg",
    "assets/images/sofol3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'আমাদের সফলতা',
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
      body: ListView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // This Will Call When User Click On ListView Item
              showDialogFunc(
                  context, imgList[index], titleList[index], descList[index]);
            },
            // Card Which Holds Layout Of ListView Item
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(imgList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index],
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            descList[index],
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// This is a block of Model Dialog
showDialogFunc(context, img, title, desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 450,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 500,
                    height: 200,
                  ),
                ),
                // SizedBox(
                //   height: 5,
                // ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(
                //   height: 5,
                // ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 10,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
