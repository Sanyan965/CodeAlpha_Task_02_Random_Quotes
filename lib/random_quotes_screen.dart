import 'package:flutter/material.dart';
import 'dart:math';

import 'package:share_plus/share_plus.dart';

class random_quotes_screen extends StatefulWidget {
  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<random_quotes_screen> {
  final List<String> quotes = [
    "The best way to predict the future is to create it.",
    "Life is what happens when you're busy making other plans.",
    "Get busy living or get busy dying.",
    "You have within you right now, everything you need to deal with whatever the world can throw at you.",
    "Believe you can and you're halfway there.",
    "The only impossible journey is the one you never begin.",
    "In the end, we will remember not the words of our enemies, but the silence of our friends.",
  ];

  String currentQuote = "Click the button to get a quote!";

  void getRandomQuote() {
    final random = Random();
    setState(() {
      currentQuote = quotes[random.nextInt(quotes.length)];
    });
  }

  void shareQuote() {
    Share.share(currentQuote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Random Quote Generator',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuote,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: getRandomQuote,
                child: const Text('Get New Quote'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: shareQuote,
                child: const Text('Share Quote'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
