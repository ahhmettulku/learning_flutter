import 'package:flutter/material.dart';
import 'package:learning_flutter/main.dart';
import 'package:learning_flutter/services/auth/auth_exceptions.dart';
import 'package:learning_flutter/services/auth/auth_service.dart';
import 'package:learning_flutter/views/register_view.dart';
import '../utilities/show_error_dialog.dart';
import 'note_view.dart';
import 'package:flutter/cupertino.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration:
                  const InputDecoration(hintText: 'Enter your email here'),
            ),
            TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration:
                  const InputDecoration(hintText: 'Enter your password here'),
            ),
            TextButton(
              onPressed: () async {
                print("Button pressed");
                final email = _email.text;
                final password = _password.text;
                var error;
                try {
                  final userCredential = await AuthService.firebase().logIn(
                    email: email,
                    password: password,
                  );

                  if (userCredential.isEmailVerified == false) {
                    print('email is not verified');
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text('Your email is not verified'),
                            actions: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                      'Send email verification code'))
                            ],
                          );
                        });
                  } else if (userCredential.isEmailVerified == true) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const NotesView()),
                        (route) => false);
                  }

                  /*
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotesView(),
                    ),
                    (route) => false,
                  );*/
                } on UserNotFoundAuthException {
                  await showErrorDialog(context, 'User Not Found');
                } on WrongPasswordAuthException {
                  await showErrorDialog(
                      context, 'Wrong password provided for that user');
                } on InvalidEmailAuthException {
                  await showErrorDialog(
                      context, 'There is no user found for that email');
                } on UserDisabledAuthException {
                  await showErrorDialog(context, 'Account Has Been Disabled');
                } on GenericAuthExceptions {
                  showErrorDialog(context, 'Authentication error');
                }
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterView()),
                  );
                },
                child: const Text("Register"))
          ],
        ),
      ),
    );
  }
}



/*
Future showErrorDialogIOS(context, String text) {
  return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Error'),
          
        );
      });
}
*/
