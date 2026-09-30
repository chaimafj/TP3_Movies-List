import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TV Series Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF3F1F4),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF3F1F4),
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.black87,
          displayColor: Colors.black87,
        ),
      ),
      home: const SeriesListPage(),
    );
  }
}

class SeriesItem {
  const SeriesItem({
    required this.title,
    required this.imageUrl,
    required this.genre,
    required this.summary,
    required this.year,
  });

  final String title;
  final String imageUrl;
  final String genre;
  final String summary;
  final int year;
}

const List<SeriesItem> seriesList = [
  SeriesItem(
    title: 'Breaking Bad',
    imageUrl: 'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?auto=format&fit=crop&w=900&q=80',
    genre: 'Crime / Drama',
    year: 2008,
    summary: 'A chemistry teacher turned meth kingpin.',
  ),
  SeriesItem(
    title: 'Stranger Things',
    imageUrl: 'https://images.unsplash.com/photo-1524985069026-dd778a71c7b4?auto=format&fit=crop&w=900&q=80',
    genre: 'Sci-Fi / Horror',
    year: 2016,
    summary:
        'A group of friends uncovers a supernatural mystery in their town.',
  ),
  SeriesItem(
    title: 'The Crown',
    imageUrl: 'https://images.unsplash.com/photo-1516280440614-37939bbacd81?auto=format&fit=crop&w=900&q=80',
    genre: 'Historical Drama',
    year: 2016,
    summary:
        'A regal look at the British monarchy and its political challenges.',
  ),
  SeriesItem(
    title: 'Dark',
    imageUrl: 'https://images.unsplash.com/photo-1513106580091-1d82408b8cd6?auto=format&fit=crop&w=900&q=80',
    genre: 'Mystery / Sci-Fi',
    year: 2017,
    summary: 'A missing child and a time-traveling mystery reshape a family.',
  ),
  SeriesItem(
    title: 'Sherlock',
    imageUrl: 'https://images.unsplash.com/photo-1536440136628-849c177e76a1?auto=format&fit=crop&w=900&q=80',
    genre: 'Crime / Mystery',
    year: 2010,
    summary: 'A brilliant detective solves impossible cases with his loyal friend.',
  ),
  SeriesItem(
    title: 'Money Heist',
    imageUrl: 'https://images.unsplash.com/photo-1526379095098-d400fd0bf935?auto=format&fit=crop&w=900&q=80',
    genre: 'Action / Thriller',
    year: 2017,
    summary: 'A mastermind plans a daring heist against the Royal Mint of Spain.',
  ),
];

class SeriesListPage extends StatelessWidget {
  const SeriesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Popular TV Shows',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        itemCount: seriesList.length,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          final series = seriesList[index];

          return InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => SeriesDetailPage(series: series),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    series.imageUrl,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        height: 220,
                        child: ColoredBox(
                          color: Colors.grey,
                          child: Icon(Icons.broken_image, size: 60),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Center(
                    child: Text(
                      series.title,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SeriesDetailPage extends StatelessWidget {
  const SeriesDetailPage({super.key, required this.series});

  final SeriesItem series;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(series.title),
        backgroundColor: const Color(0xFFF3F1F4),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              series.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 280,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 280,
                  child: ColoredBox(
                    color: Colors.grey,
                    child: Icon(Icons.broken_image, size: 60),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    series.title,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${series.genre} • ${series.year}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    series.summary,
                    style: const TextStyle(
                      fontSize: 20,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
