import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/services/auth/auth_service.dart';
import 'package:learning_flutter/views/login_view.dart';
import 'package:learning_flutter/views/register_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //scaffoldBackgroundColor: Color.fromRGBO(69, 121, 212, 100),
        //primarySwatch: Colors.purple,
        appBarTheme: const AppBarTheme(color: Color.fromRGBO(2, 119, 189, 1)),
        //platform: TargetPlatform.iOS,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder(
        future: AuthService.firebase().initialize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              /*
              final user = FirebaseAuth.instance.currentUser;
              if (user != null && user.emailVerified) {
                return const Text("Your email has been verified");
              } else if (user != null && !user.emailVerified) {
                return const VerifyEmailView();
              }
              print(user);
              return const Text("Done");
              */
              return Center(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginView()));
                            },
                            child: const Text("Login"),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterView()));
                            },
                            child: const Text("Register"),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            default:
              return const CircularProgressIndicator();
            //return const AppHomeView();
          }
        },
      ),
    );
  }
}
