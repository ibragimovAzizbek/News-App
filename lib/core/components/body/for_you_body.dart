import 'package:flutter/material.dart';
import 'package:newsapp/core/components/my_text_style.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/services/news_service.dart';

class ForYouBody {
  static Column forYou() => Column(
        children: [
          Expanded(
            flex: 8,
            child: FutureBuilder(
              future: NewsService.getData(),
              builder: (context, AsyncSnapshot<NewsModel> snap) {
                if (!snap.hasData) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snap.hasError) {
                  return const Center(
                    child: Text("Internet bilan muammo bor"),
                  );
                } else {
                  var data = snap.data;
                  return ListView.builder(
                    itemCount: data!.articles!.length,
                    itemBuilder: (_, __) => Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.01),
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 160,
                            width: 160,
                            child: Image.network(
                              data.articles![__].urlToImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.01,
                                    left: MediaQuery.of(context).size.width *
                                        0.02),
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(data.articles![__].title.toString(),
                                    style: MyTextStyle.titleTextStyle),
                              ),
                            ],
                          ),
                          const Icon(Icons.note_sharp),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      );
}
