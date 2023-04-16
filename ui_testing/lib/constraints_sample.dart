import 'package:flutter/material.dart';

class ConstraintsSample extends StatelessWidget {
  const ConstraintsSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            expandedHeight: 160,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver App Bar'),
              background: FlutterLogo(),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              child: RichText(
                  text: TextSpan(
                      text: 'hello', children: [TextSpan(text: '$index')])),
            );
          }, childCount: 10))
        ],
      ),
    );
  }
}
