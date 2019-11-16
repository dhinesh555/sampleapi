import 'package:flutter/material.dart';
import 'news.dart';
import 'package:intl/intl.dart';
import 'player_widget.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool loadingInProgress;
  var newsList;

  void getNews() async {
    News news = News();
    await news.getNews();
    setState(() {
      newsList = news.news;
      loadingInProgress = false;
    });
  }

  @override
  void initState() {
    loadingInProgress = true;
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: loadingInProgress
                ? Center(
                    child: Text("loading..."),
                  )
                : Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Top Headlines',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      Expanded(
                        child: ListView.builder(
                            itemCount: newsList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(newsList[index].title),
                                leading:
                                    Image.network(newsList[index].urlToImage),
                                subtitle: Text(
                                  DateFormat.Hm()
                                      .format(newsList[index].publishedAt),
                                ),
                                trailing: PlayerWidget(
                                  body: newsList[index].content,
                                ),
                              );
                            }),
                      ),
                    ],
                  )),
      ),
    );
  }
}
