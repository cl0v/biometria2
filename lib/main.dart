import 'package:biometria/success.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    LocalAuthentication().canCheckBiometrics.then((value) => print(value));
    // Future.delayed(Duration(seconds: 1)).then((value) => showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //           title: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: const [
    //               Icon(
    //                 Icons.fingerprint,
    //                 color: Colors.orangeAccent,
    //                 size: 42,
    //               ),
    //               Text(
    //                 ' Acesso Biometrico',
    //                 style: TextStyle(color: Colors.orangeAccent),
    //               ),
    //             ],
    //           ),
    //           content: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               const Text(
    //                 'Deseja vincular biometria para acessar o app de forma mais facil?',
    //                 style: TextStyle(fontWeight: FontWeight.bold),
    //               ),
    //               const SizedBox(
    //                 height: 16,
    //               ),
    //               Text(''),
    //               // RichText(
    //               //     text: TextSpan(
    //               //   children: [
    //               //     const TextSpan(
    //               //         text:
    //               //             'Ao continuar, voce declara estar de acordo com os '),
    //               //     TextSpan(
    //               //       text:
    //               //           'termos de uso e politicas de privacidade politicas',
    //               //       recognizer: TapGestureRecognizer()
    //               //         ..onTap = () => print('Tap Here onTap'),
    //               //     )
    //               //   ],
    //               // ))
    //             ],
    //           ),
    //         )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          label: const Text('Continuar'),
          icon: Icon(Icons.lock),
          onPressed: () async {
            var localAuth = LocalAuthentication();
            bool didAuthenticate = await localAuth.authenticate(
                localizedReason: 'Acesso ao aplicativo.',
                androidAuthStrings: AndroidAuthMessages(
                  biometricHint: 'Deseja vincular sua biometria?',
                  signInTitle: 'Acesso biometrico',
                )
                // biometricOnly: true,
                ,
                iOSAuthStrings: IOSAuthMessages());
            if (didAuthenticate) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SuccessScreen(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: 'Logado com sucesso!')));
            }
          }),
    );
  }
}
