import 'package:chem_solution_mobile/main.dart';
import 'package:chem_solution_mobile/models/Autorisation.dart';
import 'package:chem_solution_mobile/services/auth_serv.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthBloc {
  final authService = AuthService();
  final googleSignin = GoogleSignIn(scopes: ['email']);

  Stream<User> get currentUser => authService.currentUser;

  loginGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await googleSignin.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      //fire base sign in

      final result = await authService.signInWithCredential(credential);
      print('------------------------');
      Autorisation.signIn(
          '${result.user.email}', '${result.user.uid}', () => {});
      if (!autorised) {
        Autorisation.signUp(
          '${result.user.email}',
          '${result.user.displayName}',
          '${result.user.metadata.creationTime}',
          '${result.user.uid}',
        );
        Autorisation.signIn(
            '${result.user.email}', '${result.user.uid}', () => {});
      }
      print('Nick ${result.user.displayName}');
      print('Email ${result.user.email}');
      print('Password ${result.user.uid}');
      print('${result.user.metadata.creationTime}');
    } catch (e) {
      print(e);
    }
  }

  logoutGoogle() {
    authService.logout();
    googleSignin.signOut();
  }
}
