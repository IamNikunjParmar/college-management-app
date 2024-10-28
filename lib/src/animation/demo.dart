import 'package:college_management_app/src/components/custom_text.dart';
import 'package:flutter/material.dart';

import 'fade_in.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildHomeButtons(),
          ],
        ),
      ),
    );
  }
}

Row _buildHomeButtons() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      FadeInAnimation(
        delay: 1,
        fadeOffset: 60,
        direction: FadeInDirection.ltr,
        child: CustomText(
          title: "one",
          fontSize: 16,
        ),
      ),
      FadeInAnimation(
        delay: 2.5,
        fadeOffset: 220,
        direction: FadeInDirection.ltr,
        child: CustomText(
          title: "two",
          fontSize: 16,
        ),
      ),
      FadeInAnimation(
        delay: 3.5,
        fadeOffset: 300,
        direction: FadeInDirection.ltr,
        child: CustomText(
          title: "Three",
          fontSize: 16,
        ),
      ),
      FadeInAnimation(
        delay: 4.5,
        fadeOffset: 360,
        direction: FadeInDirection.ltr,
        child: CustomText(
          title: "Fourth",
          fontSize: 16,
        ),
      ),
      FadeInAnimation(
        delay: 5.5,
        fadeOffset: 440,
        direction: FadeInDirection.ltr,
        child: CustomText(
          title: "Five",
          fontSize: 16,
        ),
      ),
    ],
  );
}
