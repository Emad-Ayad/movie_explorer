import 'package:flutter/material.dart';

class CustomSearchTextField extends StatefulWidget {
  final TextEditingController searchController;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onCleared;

  const CustomSearchTextField({
    super.key,
    required this.searchController,
    this.onChanged,
    this.onCleared,
  });

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {

  final FocusNode _focusNode = FocusNode();
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(_updateClearButtonVisibility);
  }

  @override
  void dispose() {
    widget.searchController.removeListener(_updateClearButtonVisibility);
    _focusNode.dispose();
    super.dispose();
  }

  void _updateClearButtonVisibility() {
    setState(() {
      _showClearButton = widget.searchController.text.isNotEmpty;
    });
  }

  void _handleClear() {
    widget.searchController.clear();
    widget.onChanged?.call('');
    widget.onCleared?.call();
    _focusNode.requestFocus();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextField(
        controller: widget.searchController,
        focusNode: _focusNode,
        onChanged: (value) {
          widget.onChanged?.call(value);
          _updateClearButtonVisibility();
        },
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
          suffixIcon: _showClearButton
              ? IconButton(
            icon: const Icon(
              Icons.clear,
              color: Colors.white70,
            ),
            onPressed: _handleClear,
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