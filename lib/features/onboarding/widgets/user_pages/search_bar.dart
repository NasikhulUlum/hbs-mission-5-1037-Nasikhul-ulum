import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(Icons.menu),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search your destination",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none, // hilangkan garis bawah
                isDense: true,
              ),
            ),
          ),
          Icon(Icons.search),
        ],
      ),
    );
  }
}
