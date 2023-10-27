import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4, //ratio width to height
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              7,
            ),
          ),
          image: DecorationImage(
            image: AssetImage(AssetsManager.book),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
