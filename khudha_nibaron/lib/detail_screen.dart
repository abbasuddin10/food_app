import 'package:flutter/material.dart';

import 'note.dart';

class DetailScreen extends StatefulWidget {
  final Note note;

  DetailScreen(this.note);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final note = widget.note;

    return Scaffold(
      appBar: AppBar(
        title: Text('আমাদের সফলতা'),centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Hero(
                tag: note.image,
                child: Image.asset('assets/images/${note.image}'),
              ),
              SizedBox(height: 8),
              Text(
                note.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(note.content),
            ],
          ),
        ),
      ),
    );
  }
}
