import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Home/presentation/views/widgets/book_details_view_body.dart';
import '../../data/models/book_model/book_model.dart';
import '../view_model/FetchSimilarbooks_cubit/fetch_similarbooks_cubit.dart';

class DetailsBookView extends StatefulWidget {
  const DetailsBookView({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<DetailsBookView> createState() => _DetailsBookViewState();
}

class _DetailsBookViewState extends State<DetailsBookView> {
  @override
  void initState() {
    BlocProvider.of<FetchSimilarbooksCubit>(context).fetchSimilarBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(
          bookModel: widget.bookModel,
        ),
      ),
    );
  }
}
