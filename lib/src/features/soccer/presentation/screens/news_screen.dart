import 'package:flutter/material.dart';

class News {
  final String title;
  final String imageUrl;

  News({required this.title, required this.imageUrl});
}

class NewsScreen extends StatelessWidget {
  final List<News> newsList = [
    News(
      title: "Breaking News 1",
      imageUrl: "https://image-service.onefootball.com/transform?w=64&h=64&dpr=2&image=https%3A%2F%2Fimages2.minutemediacdn.com%2Fimage%2Fupload%2Fc_crop%2Cw_1919%2Ch_1079%2Cx_0%2Cy_0%2Fc_fill%2Cw_1440%2Car_16%3A9%2Cf_auto%2Cq_auto%2Cg_auto%2Fimages%2FvoltaxMediaLibrary%2Fmmsport%2F90min_en_international_web%2F01hr1rk6n5gpj40t8kcy.jpg",
    ),
    News(
      title: "Latest Update 2",
      imageUrl: "https://image-service.onefootball.com/transform?w=64&h=64&dpr=2&image=https%3A%2F%2Fimages2.minutemediacdn.com%2Fimage%2Fupload%2Fc_crop%2Cw_1919%2Ch_1079%2Cx_0%2Cy_0%2Fc_fill%2Cw_1440%2Car_16%3A9%2Cf_auto%2Cq_auto%2Cg_auto%2Fimages%2FvoltaxMediaLibrary%2Fmmsport%2F90min_en_international_web%2F01hr1rk6n5gpj40t8kcy.jpg",
    ),
    // Add more news items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return NewsCard(news: newsList[index]);
      },
    );
  }
}

class NewsCard extends StatelessWidget {
  final News news;

  NewsCard({required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(
            news.imageUrl,
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              news.title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
