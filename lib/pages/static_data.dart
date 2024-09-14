import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StaticData extends StatefulWidget {
  const StaticData({super.key});

  @override
  State<StaticData> createState() => _StaticDataState();
}

class _StaticDataState extends State<StaticData> {
  List<dynamic> books = [];
  int number = 8;

  @override
  void initState() {
    super.initState();
    fetchBooks(number);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.outlined(
              onPressed: () {
                setState(() {
                  number++;
                  fetchBooks(number);
                });
              },
              icon: const Icon(Icons.add),
            ),
            Text("$number"),
            IconButton.outlined(
              onPressed: () {
                setState(() {
                  number--;
                  fetchBooks(number);
                });
              },
              icon: const Icon(Icons.remove),
            ),
          ],
        ),
        ListView.builder(
          itemCount: books.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding:
              const EdgeInsetsDirectional.only(top: 10, start: 40, end: 40),
          itemBuilder: (context, index) {
            final book = books[index];
            return ListTile(
              leading: const Icon(Icons.menu_book),
              title: Text(book['title']),
              subtitle: Text(book['author']),
            );
          },
        ),
      ],
    );
  }

  void fetchBooks(int count) async {
    if (kDebugMode) {
      print("fetching books");
    }
    final url = "https://fakerapi.it/api/v2/books?_quantity=$count";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final booksJson = jsonDecode(body);
    setState(() {
      books = booksJson['data'];
    });
    if (kDebugMode) {
      print("completed fetching books");
    }
  }
}
