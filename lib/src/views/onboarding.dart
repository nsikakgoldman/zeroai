import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:zeroai/src/views/chat_body.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final List<Map<String, dynamic>> _items = [
    {"name": "Food and Grocedries", "image": "pexels-lisa-fotios-1992912.jpg"},
    {"name": "Shopping (stores)", "image": "pexels-ethan-brooke-2128042.jpg"},
    {"name": "Energy", "image": "pexels-pixabay-266429.jpg"},
    {"name": "Health", "image": "pexels-chokniti-khongchum-2280551.jpg"},
    {"name": "Transport", "image": "pexels-aleksejs-bergmanis-681335.jpg"},
    {"name": "Travel", "image": "pexels-sheila-731217.jpg"},
    {"name": "Housing", "image": "pexels-paul-volkmer-3353801.jpg"},
    {"name": "Public service", "image": "pexels-volkan-vardar-3887985.jpg"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: MasonryView(
            listOfItem: _items,
            numberOfColumn: 2,
            itemBuilder: (item) {
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChatScreen(serviceName: item["name"]))),
                child: Column(
                  children: [
                    Image.asset("assets/${item['image']}"),
                    ListTile(
                      dense: true,
                      title: Text("${item['name']}"),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
