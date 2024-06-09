import 'package:flutter/material.dart';
import 'package:jala_media/app/utils/colors.dart';
import 'package:jala_media/app/utils/jala_icons.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget(
      {super.key,
      required this.searchController,
      this.hint = '',
      required this.onSearch});
  final TextEditingController searchController;
  final String hint;
  final ValueChanged<String> onSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.search,
      textAlign: TextAlign.left,
      onSubmitted: onSearch,
      decoration: InputDecoration(
        fillColor: inputColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 8,
        ),
        hintText: hint,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        filled: true,
        isDense: true,
        isCollapsed: true,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 24,
          minHeight: 24,
        ),
        hintStyle: TextStyle(color: hintColor),
        prefixIcon: Container(
          padding: const EdgeInsets.only(right: 4, left: 8),
          child: const Icon(
            JalaIcon.search,
            color: hintColor,
            size: 24,
          ),
        ),
      ),
    );
  }
}
