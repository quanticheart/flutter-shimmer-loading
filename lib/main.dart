import 'package:flutter/material.dart';
import 'package:shimmer/counter_ext.dart';
import 'package:shimmer/shimmer.dart';

import 'model/message.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExampleGradientBubbles(),
    );
  }
}

class ExampleGradientBubbles extends StatefulWidget {
  const ExampleGradientBubbles({super.key});

  @override
  State<ExampleGradientBubbles> createState() => _ExampleGradientBubblesState();
}

class _ExampleGradientBubblesState extends State<ExampleGradientBubbles> {
  late final List<Message> data;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    data = MessageGenerator.generate(60, 1337);
    delay(2, () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF4F4F4F),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Loading'),
        ),
        body: Container(
          child: isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[700]!,
                  highlightColor: Colors.grey[500]!,
                  direction: ShimmerDirection.ltr,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    reverse: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final message = data[index];
                      return Card(
                        child: SizedBox(
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                message.text,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  reverse: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final message = data[index];
                    return Card(
                      child: SizedBox(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              message.text,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
