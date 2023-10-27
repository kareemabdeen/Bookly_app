import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../Search/presentation/views/search_view.dart';

class BuildCustomAppBar extends StatelessWidget {
  const BuildCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 32,
        top: 43,
      ),
      child: Row(
        children: [
          Image.asset(
            AssetsManager.logo,
            height: 18,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              context.simplePush(const SearchView());
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
