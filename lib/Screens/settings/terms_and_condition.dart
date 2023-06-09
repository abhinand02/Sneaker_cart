import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: rootBundle.loadString('assets/terms_and_conditions.md'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Markdown(
                data: snapshot.data!,
                styleSheet: MarkdownStyleSheet.fromTheme(
                  ThemeData(
                      textTheme:  TextTheme(
                          bodyMedium:
                              TextStyle(fontSize: 14,color: Colors.black),),),
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
