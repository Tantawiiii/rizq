import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  static GoogleSignInAccount? _currentUser;
  static bool _initialized = false;


  Future<void> initialize() async {
    if (_initialized) return;
    await _googleSignIn.initialize();
    _initialized = true;


    _googleSignIn.authenticationEvents.listen((event) {
      if (event is GoogleSignInAuthenticationEventSignIn) {
        _currentUser = event.user;
      } else if (event is GoogleSignInAuthenticationEventSignOut) {
        _currentUser = null;
      }
    });


    final account = await _googleSignIn.attemptLightweightAuthentication();
    _currentUser = account;
  }

  Future<GoogleSignInAccount?> signIn() async {
    try {
      if (!_initialized) {
        await initialize();
      }
      final GoogleSignInAccount account = await _googleSignIn.authenticate(
        scopeHint: ['email', 'profile'],
      );
      _currentUser = account;
      return account;
    } on GoogleSignInException catch (error) {
      if (error.code == GoogleSignInExceptionCode.canceled) {
        return null;
      }
      print('Error signing in with Google: $error');
      rethrow;
    } catch (error) {
      print('Error signing in with Google: $error');
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      if (!_initialized) {
        await initialize();
      }
      await _googleSignIn.signOut();
      _currentUser = null;
    } catch (error) {
      print('Error signing out from Google: $error');
      rethrow;
    }
  }

  GoogleSignInAccount? getCurrentUser() {
    return _currentUser;
  }

  bool isSignedIn() {
    return _currentUser != null;
  }
}
