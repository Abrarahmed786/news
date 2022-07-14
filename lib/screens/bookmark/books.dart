// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:news/model/book_model.dart';
import 'package:news/screens/bookmark/book_detail_screen.dart';
import 'package:news/services/api_books.dart';
import 'package:news/widgets/book_sheet_widget.dart';
import 'package:news/widgets/book_widget.dart';
import 'package:provider/provider.dart';

class Books extends StatefulWidget {
  const Books({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  final ScrollController _scrollController = ScrollController();
  HomeProvider? _provider;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<HomeProvider>(context, listen: false);
    _provider?.getBooks();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getBooksApi();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, widget) => SafeArea(
        top: true,
        child: Scaffold(
          floatingActionButton: _floatingActionWidget(),
          body: Column(
            children: [
              _toolbar(),
              Expanded(
                child: Stack(
                  children: [
                    ListView.separated(
                      primary: false,
                      shrinkWrap: true,
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      itemCount: provider.books.length,
                      itemBuilder: (context, position) {
                        final book = provider.books[position];
                        return InkWell(
                          onTap: () {
                            _openBookDetail(book);
                          },
                          child: BookWidget(
                              book.title,
                              book.subtitle ?? book.description,
                              book.thumbnail),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: Color(0xffDADADA),
                        );
                      },
                    ),
                    provider.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openBookDetail(BookModel book) {
    print("book.id ${book.id}");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BookDetailScreen(bookId: book.id)));
  }

  Widget _toolbar() {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Book Library",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  void _openSearchBottomSheet() {
    showModalBottomSheet(
        context: context,
        barrierColor: Colors.transparent,
        elevation: 10,
        isScrollControlled: true,
        builder: (ctx) {
          return FractionallySizedBox(
            heightFactor:
                MediaQuery.of(context).viewInsets.bottom == 0 ? 0.3 : 0.7,
            child: BottomSheetWidget(),
          );
        }).then((value) {
      if (value != null) {
        _provider?.query = value;
        _provider?.books.clear();
        _getBooksApi();
      }
    });
  }

  Widget _floatingActionWidget() {
    return RawMaterialButton(
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(16),
      elevation: 2,
      fillColor: Colors.blue,
      child: const Icon(
        Icons.search_outlined,
        size: 38,
        color: Colors.white,
      ),
      onPressed: () {
        _openSearchBottomSheet();
      },
    );
  }

  void _getBooksApi() {
    _provider?.showLoading();
    _provider?.getBooks();
  }
}
