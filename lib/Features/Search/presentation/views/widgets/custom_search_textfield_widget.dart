import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.white70,
            size: 32,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.elliptical(12, 12),
          ),
          borderSide: BorderSide(
            color: Colors.white54,
          ),
        ),
      ),
    );
  }
}
