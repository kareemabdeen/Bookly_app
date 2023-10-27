import 'package:flutter/material.dart';

import '../../../Home/presentation/views/widgets/book_details_view_body.dart';

class DetailsBookView extends StatelessWidget {
  const DetailsBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: BookDetailsViewBody()),
    );
  }
}
