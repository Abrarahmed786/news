// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:news/model/book_model.dart';
import 'package:news/screens/bookmark/books.dart';
import 'package:news/services/api_book_detail.dart';
import 'package:news/services/api_books.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({this.bookId});

  final String? bookId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Detail"),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            if (_isBookListNotEmpty(context)) {
              Navigator.pop(context);
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Books()));
            }
          },
        ),
      ),
      bottomNavigationBar: _bottomNavWidget(),
      body: FutureBuilder<BookModel?>(
        future: DetailProvider().getBookDetail(bookId),
        builder: (context, apiResponse) {
          final bookModel = apiResponse.data;
          DetailProvider.bookUrl = bookModel?.bookUrl;

          if (apiResponse.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (apiResponse.connectionState == ConnectionState.done &&
              bookModel == null) {
            return const Center(
              child: Text(
                "Data not found",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Text(
                    "${bookModel?.title}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Text(
                    bookModel?.subtitle ?? "-",
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Image.network(bookModel?.thumbnail ?? "")),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: HtmlWidget(bookModel?.description ?? "-")),
              ],
            ),
          );
        },
      ),
    );
  }

  bool _isBookListNotEmpty(BuildContext context) {
    return Provider.of<HomeProvider>(context, listen: false).books.isNotEmpty;
  }

  Widget _bottomNavWidget() {
    final widget = Container(
      color: Colors.blue,
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Buy Book",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
    return InkWell(
      child: widget,
      onTap: () async {
        final url = DetailProvider.bookUrl;
        if (url != null) {
          // ignore: deprecated_member_use
          if (!await launch(url)) throw 'Could not launch $url';
        }
      },
    );
  }
}
