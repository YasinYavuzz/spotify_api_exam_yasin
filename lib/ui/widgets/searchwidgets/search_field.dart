import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        //controller: _controller,
        onChanged: (value) {
          
        },
        onTap: () {
          print('tıklandı');
        },
        decoration: InputDecoration(
            hintText: 'Ne dinlemek istiyorsun?',
            // hintStyle: const TextStyle(),
            prefixIcon: const Icon(
              Icons.search,
              size: 26,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
