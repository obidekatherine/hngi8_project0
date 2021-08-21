import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hngi8_project0/pages/page1.dart';
import 'package:hngi8_project0/user.dart';
import 'package:hngi8_project0/widgets/widget1.dart';
import 'package:hngi8_project0/widgets/widget4.dart';
import 'package:url_launcher/url_launcher.dart';

import '../userPreference.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const _url = 'https://internship.zuri.team';
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()));
              setState(() {});
            },
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          buildAddress(user),
          const SizedBox(height: 48),
          buildAbout(user),
          const SizedBox(height: 50),
          Text(
            'For More Info Visit',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 100,
                child: Image(
                  image: AssetImage('assets/download.jpg'),
                ),
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: _launchURL,
                child: Text(
                  'https://internship.zuri.team',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildAddress(User user) => Text(
        user.address,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
