import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:login_screen_ui/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool _isEmailValid = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkEmailValidity);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _checkEmailValidity() {
    final email = _emailController.text;
    final emailRegex = RegExp(
        r"^[a-z0-9._%+-]+@(gmail\.com|yahoo\.com|outlook\.com|hotmail\.com|icloud\.com)$");

    bool isValid = emailRegex.hasMatch(email);

    if (_isEmailValid != isValid) {
      setState(() {
        _isEmailValid = isValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true, // Handles keyboard overlap
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Theme.of(context).colorScheme.secondary,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new, size: 20.sp),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 50.h),
                _buildTitle(),
                SizedBox(height: 100.h),
                _buildEmailField(),
                SizedBox(height: 10.h),
                _buildPasswordField(),
                SizedBox(height: 10.h),
                _buildForgotPassword(),
                SizedBox(height: 150.h),
                _buildLoginButton(),
                SizedBox(height: 20.h),
                _buildDivider(),
                SizedBox(height: 20.h),
                _buildSignupButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Title Section
  Widget _buildTitle() {
    return Text(
      'Welcome\nBack',
      style: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  /// Email Input Field
  Widget _buildEmailField() {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'username@example.com',
        prefixIcon: const Icon(Icons.email_outlined),
        suffixIcon: Icon(
          _isEmailValid ? Icons.check : null,
          color: _isEmailValid ? Colors.green : null,
        ),
      ),
    );
  }

  /// Password Input Field
  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordController,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          onPressed: _togglePasswordVisibility,
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );
  }

  /// Forgot Password Text
  Widget _buildForgotPassword() {
    return Text(
      'Forgot password?',
      textAlign: TextAlign.right,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
        fontSize: 16.sp,
      ),
    );
  }

  /// Login Button
  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          foregroundColor: Theme.of(context).colorScheme.surface,
        ),
        onPressed: () {
          // Handle Login Logic
        },
        child: Text(
          'Log in',
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
    );
  }

  /// "OR" Divider
  Widget _buildDivider() {
    return const Row(
      children: [
        Expanded(child: Divider(color: Colors.grey, thickness: 1.0)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('or'),
        ),
        Expanded(child: Divider(color: Colors.grey, thickness: 1.0)),
      ],
    );
  }

  /// Signup Button
  Widget _buildSignupButton() {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.teal,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => SignupScreen(),
            ),
          );
        },
        child: Text(
          'Sign up',
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
    );
  }
}
