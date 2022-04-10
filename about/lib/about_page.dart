import 'package:flutter/material.dart';
import 'package:core/core.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: kPrussianBlue,
            child: Center(
              child: Image.asset(
                'assets/circle-g.png',
                width: 128,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(32.0),
            color: kMikadoYellow,
            child: Text(
              'Ditonton merupakan sebuah aplikasi katalog film yang dikembangkan oleh Dicoding Indonesia sebagai contoh proyek aplikasi untuk kelas Menjadi Flutter Developer Expert.',
              style: TextStyle(color: Colors.black87, fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }
}
