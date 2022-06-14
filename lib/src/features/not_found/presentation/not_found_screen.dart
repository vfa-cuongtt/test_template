import 'package:flutter/material.dart';
import 'package:test_template/src/routers/e_page.dart';

class NotFoundScreen extends EPage {
  const NotFoundScreen({required Map<String, dynamic> args})
      : super(args: args);

  @override
  Widget build(BuildContext context) {
    return const NotFoundView();
  }
}

class NotFoundView extends StatelessWidget {
  const NotFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not found screen'),
      ),
      body: const Center(
        child: Text('This is not found screen'),
      ),
    );
  }
}
