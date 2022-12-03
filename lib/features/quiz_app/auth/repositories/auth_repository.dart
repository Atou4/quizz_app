import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizz_app/features/quiz_app/auth/models/user_model.dart';
import '../../../../utils/constants.dart';
import 'auth_user.dart';

class SignUpWithEmailAndPasswordFailure implements Exception {
  final String code;
  const SignUpWithEmailAndPasswordFailure(this.code);
}

class SignInWithEmailAndPasswordFailure implements Exception {
  final String code;
  const SignInWithEmailAndPasswordFailure(this.code);
}

class ForgotPasswordFailure implements Exception {
  final String code;
  const ForgotPasswordFailure(this.code);
}

class SignInWithGoogleFailure implements Exception {}

class SignOutFailure implements Exception {}

class AuthenticationRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Stream<AuthUser> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null
          ? AuthUser.empty
          : AuthUser(
              id: firebaseUser.uid,
              email: firebaseUser.email,
              name: firebaseUser.displayName,
              emailVerified: firebaseUser.emailVerified,
            );
    });
  }

  Future<void> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required UserModel userr}) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authResult.user != null) {
        usersRef.doc(authResult.user!.uid).set(
              userr.toDocument(),
            );
      }
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure(e.code);
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw SignInWithEmailAndPasswordFailure(e.code);
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw ForgotPasswordFailure(e.code);
    }
  }

  Future<void> signOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
      ]);
    } catch (_) {
      throw SignOutFailure();
    }
  }
}
/*
try {
      var authResult =
          await _read.read(firebaseAuthProvider).createUserWithEmailAndPassword(
                email: user.email.toString(),
                password: password,
              );

      if (authResult.user != null) {
        final docRef = await _read
            .read(firebaseFirestoreProvider)
            .usersListRef(userid)
            .add(user.toDocument());
        return docRef.id;
      } else {
        return "";
      }
    }*/