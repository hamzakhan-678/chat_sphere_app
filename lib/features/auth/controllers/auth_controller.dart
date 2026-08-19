import 'package:chat_sphere_app/Features/Auth/Models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final _firebaseAuth = FirebaseAuth.instance;
  final dbRef = FirebaseDatabase.instance.ref();
  final box = GetStorage();
  final String userKey = 'currentUser';

  RxBool isLoading = false.obs;
  Rx<UserModel> userModel = UserModel().obs;

  Future<void> registerUser({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userCredential) async {
            if (userCredential.user != null) {
              // Updatig userModel
              userModel.value = UserModel(
                id: userCredential.user?.uid,
                email: email,
                isOnline: false,
                lastSeen: userCredential.user?.metadata.lastSignInTime,
                name: fullName,
                profileImageUrl: userCredential.user?.photoURL,
              );
              update();

              debugPrint('User Model: ${userModel.value}');

              // Saving user to database
              await dbRef
                  .child('Users/${userModel.value.id}')
                  .set(userModel.value.toJson());

              // Caching
              box.write(userKey, userModel.value.toJson());
            }
          })
          .onError((error, stackTrace) {
            debugPrint('Error: ${error.toString()}');
            throw Exception(error);
          });
    } on Exception catch (e) {
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      final uid = userCredential.user?.uid;

      if (uid == null) throw Exception('User data missing');

      DataSnapshot snapshot = await dbRef.child('Users').child(uid).get();

      if (snapshot.exists) {
        final data = Map<String, dynamic>.from(
          snapshot.value as Map<dynamic, dynamic>,
        );

        userModel.value = UserModel.fromJson(data);
        update();

        debugPrint('User Model: ${userModel.value}');

        await box.write(userKey, userModel.value.toJson());
      } else {
        throw Exception('No user found in the database');
      }
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future forgotPassword({required String email}) async {
    try {
      isLoading.value = true;

      await _firebaseAuth
          .sendPasswordResetEmail(email: email)
          .then((value) {
            return true;
          })
          .onError((error, stackTrace) {
            debugPrint("Error: ${error.toString()}");
            return false;
          });
    } on Exception catch (e) {
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> logoutUser() async {
    try {
      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 1));

      await _firebaseAuth.signOut();

      await box.remove(userKey);

      userModel.value = UserModel();
      update();

      return true;
    } on Exception catch (e) {
      debugPrint('Logout Error: ${e.toString()}');
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
