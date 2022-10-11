import 'package:firebase_core/firebase_core.dart';
import 'package:learning_flutter/services/auth/auth_provider.dart';
import 'package:learning_flutter/services/auth/auth_user.dart';
import 'package:learning_flutter/services/auth/firebase_auth_provider.dart';

import '../../firebase_options.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;
  const AuthService(this.provider);

  factory AuthService.firebase() => AuthService(FireBaseAuthProvider());

  @override
  Future<AuthUser> createUser(
          {required String email, required String password}) =>
      provider.createUser(email: email, password: password);

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({required String email, required String password}) =>
      provider.logIn(email: email, password: password);

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<void> initialize() => provider.initialize();
}
