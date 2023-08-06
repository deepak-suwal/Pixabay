import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController searchController;
  final Function() onSearchPressed;
  final Function() onClosePressed;

  const SearchWidget({
    super.key,
    required this.searchController,
    required this.onSearchPressed,
    required this.onClosePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          Row(
            children: [
              TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Search for all images',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ).expanded(),
              IconButton(
                onPressed: onClosePressed,
                icon: const Icon(Icons.close),
              ),
            ],
          ).expanded(),
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(24),
            ),
            child: IconButton(
              onPressed: onSearchPressed,
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
