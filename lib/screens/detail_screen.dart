import 'package:flutter/material.dart';
import 'package:page_practice/models/book.dart';

class BookDetailPage extends Page {
  final Book book;

  BookDetailPage({
    required this.book,
  }) : super(key: ValueKey(book));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return BookDetailScreen(book: book);
      },
    );
  }
}

class BookDetailScreen extends StatelessWidget {
  final Book book;

  const BookDetailScreen({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(book.title, style: Theme.of(context).textTheme.headlineLarge),
            Text(book.author, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
