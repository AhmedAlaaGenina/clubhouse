import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String txt;

  const TextWidget({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          txt,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
