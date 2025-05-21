import 'package:flutter/material.dart';
import 'auth_service.dart';
import '../profile/profile_screen.dart';
import '../dashboard/dashboard_screen.dart';
import '../../config/constants.dart';
import '../../main.dart'; // pour accéder à themeModeNotifier
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _obscureText = true;
  bool _loading = false;
  String? _error;

  double _logoTopPadding = 30;
  double _formTopPadding = 170;

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(_handleFocusChange);
    _passwordFocusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      if (_emailFocusNode.hasFocus || _passwordFocusNode.hasFocus) {
        _logoTopPadding = 10;
        _formTopPadding = 120;
      } else {
        _logoTopPadding = 30;
        _formTopPadding = 170;
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.removeListener(_handleFocusChange);
    _passwordFocusNode.removeListener(_handleFocusChange);
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const DashboardScreen()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Login',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: 1.2,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(isDark ? Icons.wb_sunny : Icons.nightlight_round),
              tooltip: isDark ? 'Mode clair' : 'Mode sombre',
              onPressed: () {
                themeModeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 48),
                Padding(
                  padding: EdgeInsets.only(top: _logoTopPadding),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/avatar.jpg',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'STUDENT LOGIN',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _formTopPadding),
                  child: Column(
                    children: [
                      TextField(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        decoration: const InputDecoration(
                          labelText: 'Registration Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility_off : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                        obscureText: _obscureText,
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()),
                            );
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: AppColors.darkRed, // dark red
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      if (_error != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(_error!, style: const TextStyle(color: Colors.red)),
                        ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.darkRed, // dark red
                                foregroundColor: Colors.white,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                              onPressed: _loading
                                  ? null
                                  : () async {
                                      setState(() {
                                        _loading = true;
                                        _error = null;
                                      });
                                      // Auth désactivée temporairement :
                                      await Future.delayed(const Duration(milliseconds: 500));
                                      setState(() {
                                        _loading = false;
                                      });
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (_) => const DashboardScreen()),
                                      );
                                    },
                              child: _loading
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                                    )
                                  : const Text(
                                      'Login',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        letterSpacing: 1.1,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: AppColors.darkRed, width: 2), // dark red
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                foregroundColor: AppColors.darkRed, // dark red
                              ),
                              onPressed: () {
                                // TODO: Logic for First Time Login
                              },
                              child: const Text(
                                'First Time Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 1.1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
