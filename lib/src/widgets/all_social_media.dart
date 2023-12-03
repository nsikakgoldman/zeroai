import 'package:flutter/material.dart';

import 'social_media_btn.dart';

class AllSocialMedia extends StatelessWidget {
  const AllSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialMediaButton(
          imagePath: 'google_icgoogle.png',
        ),
        SizedBox(
          width: 8,
        ),
        SocialMediaButton(
          imagePath: 'cib_appleapple.png',
        ),
        SizedBox(
          width: 8,
        ),
        SocialMediaButton(
          imagePath: 'facebook_ic.png',
        ),
      ],
    );
  }
}
