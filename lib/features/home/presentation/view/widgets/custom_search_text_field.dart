import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String>? onChanged;

  const CustomSearchTextField({
    super.key,
    required this.searchController,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: searchController,
        onChanged: onChanged,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF2E2E2E),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          border: _buildOutlineInputBorder(const Color(0xFF444444)),
          enabledBorder: _buildOutlineInputBorder(const Color(0xFF444444)),
          focusedBorder: _buildOutlineInputBorder(const Color(0xFF1E88E5)),
          hintText: 'Search movies...',
          hintStyle: const TextStyle(
            color: Color(0xFF9E9E9E),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFF9E9E9E),
          ),
          suffixIcon: searchController.text.isNotEmpty
              ? IconButton(
            icon: const Icon(
              Icons.clear,
              color: Colors.white70,
            ),
            onPressed: () {
              searchController.clear();
              onChanged?.call('');
            },
          )
              : null,
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(
        color: color,
        width: 1.5,
      ),
    );
  }
}