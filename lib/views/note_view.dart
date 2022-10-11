import 'package:flutter/material.dart';
import 'package:learning_flutter/main.dart';
import 'package:learning_flutter/services/auth/auth_exceptions.dart';
import 'package:learning_flutter/services/auth/auth_service.dart';
import 'package:learning_flutter/utilities/show_error_dialog.dart';

import '../enums/menu_action.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
        actions: [
          IconButton(
              onPressed: () async {
                try {
                  await AuthService.firebase().logOut();
                } on GenericAuthExceptions {
                  showErrorDialog(context, 'Error occured');
                }
                print('User Has Signouted');
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false);
              },
              icon: const Icon(Icons.logout)),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Item 1'),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.anchor),
                  title: Text('Item 2'),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.article),
                  title: Text('Item 3'),
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(child: Text('Item A')),
              const PopupMenuItem(child: Text('Item B')),
            ],
          ),
          PopupMenuButton<MenuActions>(
            onSelected: (value) async {
              switch (value) {
                case MenuActions.logout:
                  final shouldLogOut = await showLogOutDialog(context);
                  print(shouldLogOut);
                  if (shouldLogOut) {
                    try {
                      await AuthService.firebase().logOut();
                      print('User has logged out');
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                          (route) => false);
                    } on GenericAuthExceptions {
                      showErrorDialog(context, 'Error occured');
                    }
                  }
                  break;
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuActions>(
                  value: MenuActions.logout,
                  child: ListTile(
                    title: Text('Log out'),
                    leading: Icon(Icons.logout),
                  ),
                )
              ];
            },
          )
        ],
      ),
      body: Center(),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text('Signout'),
          content: const Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Sign out'),
            )
          ],
        );
      })).then((value) => value ?? false);
}
