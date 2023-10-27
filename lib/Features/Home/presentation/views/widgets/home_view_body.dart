import 'package:flutter/material.dart';

import '../../../../Home/presentation/views/widgets/best_seller_listview_widget.dart';
import '../../../../Home/presentation/views/widgets/custom_home_appbar_widget.dart';
import '../../../../Home/presentation/views/widgets/featured_list_view.dart';
import '../../../../Home/presentation/views/widgets/styling_text_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildCustomAppBar(),
              FeaturedListView(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 21.0),
                child: StylingTextWidget(),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: BestSellerListView(),
        ),
      ],
    );
  }
}
