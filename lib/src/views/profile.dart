import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zeroai/src/widgets/profile_settting_text.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: ListView(
        children: [
          const SizedBox(
            width: 81,
            height: 76,
            child: Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/3189024/pexels-photo-3189024.jpeg?auto=compress&cs=tinysrgb&w=1600'),
                maxRadius: 50,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: IconButton(
                onPressed: () => debugPrint("hi"),
                icon: const Icon(Icons.edit)),
          ),
          const SizedBox(
            height: 21,
          ),
          const Text(
            'Triana Adewole',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
              height: 0.09,
              letterSpacing: 0.50,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton.icon(
              onPressed: null,
              icon: const Icon(Icons.location_on),
              label: const Text("Lagos, Nigeria")),
          const SizedBox(
            height: 50,
          ),
          ListTile(
            onTap: () => debugPrint("hi"),
            leading: const Icon(Icons.lock),
            title: const ProfileSettingText(text: 'Security'),
          ),
          const Divider(),
          ListTile(
            dense: true,
            onTap: () => debugPrint("hi"),
            leading: const Icon(Icons.help),
            title: const ProfileSettingText(text: 'Help & Support'),
          ),
          const Divider(),
          ListTile(
            onTap: () => debugPrint("hi"),
            leading: const Icon(Icons.privacy_tip),
            title: const ProfileSettingText(text: 'Privacy Policy'),
          ),
          const Divider(),
          ListTile(
            onTap: () => _logout(),
            leading: const Icon(Icons.logout),
            title: const ProfileSettingText(text: 'Log Out'),
          )
        ],
      )),
    );
  }

  void backToLogin() =>
      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);

  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      backToLogin();
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
