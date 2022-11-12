// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key, String? title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Apps Developer',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 4.5,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/flutter.jpg')),
                  Positioned(
                      bottom: -50.0,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Color.fromARGB(255, 13, 53, 118),
                        child: CircleAvatar(
                            radius: 75,
                            backgroundImage:
                                AssetImage('assets/images/abbas1.png')),
                      )),
                  Positioned(
                      left: 6,
                      bottom: -60,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Color.fromARGB(255, 13, 53, 118),
                        child: CircleAvatar(
                            radius: 75,
                            backgroundImage:
                                AssetImage('assets/images/alamin.jpg')),
                      )),
                  Positioned(
                      right: 6,
                      bottom: -60,

                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Color.fromARGB(255, 13, 53, 118),
                        child: CircleAvatar(
                            radius: 75,
                            backgroundImage:
                                AssetImage('assets/images/mehedi.jpg')),
                      )
                  ),
                ]

            ),
            SizedBox(
              height: 40,
            ),
            ListTile(
              title: Center(
                  child: Text(
                'We are Developer ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              )),
              subtitle:
                  Center(child: Text('In This App we make helping Society')),
            ),
            ListTile(
              title: Text('About us ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
              subtitle: Text(
                  'The person in the middle is Abbas Uddin, the leader of the app and the two people on the side (Alamin Akanda on the left side and Mehedi Hasan on the right side) are helping hands.Through this we will distribute the wasted food of our society among the poor and helpless people'),


            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text('Address',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
              subtitle: Text(
                  'We are 3 students of ZHSUST department of Computer Science and Engineering  '),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text('Social Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
              subtitle: Row(
                children: [
                  Expanded(
                    child: IconButton(
                      color: Colors.blue,
                      icon: FaIcon(
                        FontAwesomeIcons.github,
                      ),
                      onPressed: () async {
                        launchUrl(
                          Uri.parse('https://github.com/abbasuddin10'),
                        );
                        final url = Uri.parse(
                          'https://github.com/abbasuddin10',
                        );
                        if (await canLaunchUrl(url)) {
                          launchUrl(url);
                        } else {
                          // ignore: avoid_print
                          print("Can't launch $url");
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      color: Colors.blue,
                      icon: FaIcon(FontAwesomeIcons.linkedin),
                      onPressed: () async {
                        launchUrl(
                          Uri.parse('https://www.linkedin.com/in/abbasuddin10/'),
                        );
                        final url = Uri.parse(
                          'https://www.linkedin.com/in/abbasuddin10/',
                        );
                        if (await canLaunchUrl(url)) {
                          launchUrl(url);
                        } else {
                          // ignore: avoid_print
                          print("Can't launch $url");
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      color: Colors.blue,
                      icon: FaIcon(FontAwesomeIcons.facebook),
                      onPressed: () async {
                        launchUrl(
                          Uri.parse('https://www.facebook.com/abbas.uddin15'),
                        );
                        final url = Uri.parse(
                          'https://www.facebook.com/abbas.uddin15',
                        );
                        if (await canLaunchUrl(url)) {
                          launchUrl(url);
                        } else {
                          // ignore: avoid_print
                          print("Can't launch $url");
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      color: Colors.blue,
                      icon: FaIcon(FontAwesomeIcons.instagram),
                      onPressed: () async {},
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
