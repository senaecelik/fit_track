import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track/domain/model/user_model.dart';
import 'package:fit_track/utils/resources/string_manager.dart';

class AuthRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  // Giriş yap
  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      if (e.code == 'invalid-email') {
        throw StringManager.instance.invalidMail;
      } else if (e.code == 'wrong-password') {
        throw StringManager.instance.wrongPassword;
      } else if (e.code == 'user-not-found') {
        throw StringManager.instance.userNotFound;
      } else if (e.code == 'user-disabled') {
        throw StringManager.instance.userDisable;
      } else if (e.code == 'operation-not-allowed') {
        throw StringManager.instance.userDisable;
      }
    }
  }

// Kullanıcı kayıt olma
  Future<User?> signUpWithEmail({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserModel model = UserModel(
        id: _auth.currentUser!.uid,
        email: email,
        name: username,
      );
      await _firestore
          .collection("user")
          .doc(user.user!.uid)
          .set(model.toJson());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw StringManager.instance.weakPassword;
      } else if (e.code == 'email-already-in-use') {
        throw StringManager.instance.emailAlreadyInUse;
      } else if (e.code == 'invalid-email') {
        throw StringManager.instance.invalidMail;
      }
    }
    return null;
  }

  ///User signOut
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    }
  }

  // Kullanıcının bilgilerini kullanmak için
  Future<UserModel> getUserInformation() async {
    UserModel userInfo = UserModel();
    try {
      final userInformation =
          await _firestore.collection('user').doc(_auth.currentUser!.uid).get();

      final user = userInformation.data() as Map<String, dynamic>;
      userInfo = UserModel.fromJson(user);

      return userInfo;
    } on FirebaseException {
      return userInfo;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
