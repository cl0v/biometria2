
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF5BE3BF),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_rounded,
                    size: 100,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26, right: 26, bottom: 38),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .85,
                height: 50,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(
                    'Confirmar',
                    // style: theme.textTheme.headline6,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}