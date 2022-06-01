import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/article_model.dart';
import '../services/api_services.dart';

class TopNews extends StatelessWidget {
  const TopNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiService client = ApiService();

    return FutureBuilder(
      future: client.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          return ListView.builder(
            itemCount: articles?.length,
            itemBuilder: (context, index) => ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(
                            articles![index].urlToImage.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    articles[index].source!.name.toString(),
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                maxRadius: 30,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.bookmark_outline,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 400,
                        ),
                        Container(
                          color: Colors.black.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${articles[index].title}\n\n${articles[index].source!.name}",
                                style: GoogleFonts.lato(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white,
                                    fontSize: 25),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                  // Text(articles[index].url.toString()),
                  // Text(articles[index].description.toString()),
                  // Text(articles[index].content.toString()),
                  // Text(articles[index].publishedAt.toString()),
                  // Text(articles[index].source.toString()),
                ],
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
