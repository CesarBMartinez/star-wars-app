import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.episodeId,
    required this.title,
    required this.director,
    required this.producers,
    required this.releaseDate,
    required this.actionButton,
  });

  final int episodeId;
  final String title;
  final String director;
  final String producers;
  final String releaseDate;
  final Widget actionButton;

  Widget _textWithBold(String text, String bold) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black,
        ),
        text: '$text: ',
        children: [
          TextSpan(
              text: bold,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image:
                  AssetImage('assets/images/star-wars-episode-$episodeId.jpg'),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            _textWithBold('Directed by', director),
            _textWithBold('Produced by', producers),
            _textWithBold('Release date', releaseDate),
            actionButton,
          ],
        ),
      ),
    );
  }
}
