import 'package:flutter/material.dart';

class ReuseableCircularProgressIndicator extends StatelessWidget {
  const ReuseableCircularProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      child: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.onSecondary,
          backgroundColor: Theme.of(context).colorScheme.secondaryVariant,
        ),
      ),
    );
  }
}
