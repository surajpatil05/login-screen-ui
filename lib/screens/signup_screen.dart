import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:login_screen_ui/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscureText = true;
  bool _isEmailValid = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// Initializes controllers
  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkEmailValidity);
  }

  /// Disposes controllers
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Toggles password visibility
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  /// Checks if email is valid
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
        resizeToAvoidBottomInset: true, // Prevents keyboard overflow
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Theme.of(context).colorScheme.primary,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, size: 20.sp),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 50.h),
                  _buildTitle(context),
                  SizedBox(height: 80.h),
                  _buildNameField(),
                  SizedBox(height: 10.h),
                  _buildEmailField(),
                  SizedBox(height: 10.h),
                  _buildPasswordField(),
                  SizedBox(height: 150.h),
                  _buildSignupButton(),
                  SizedBox(height: 20.h),
                  _buildDivider(),
                  SizedBox(height: 20.h),
                  _buildLoginButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Title Section
  Widget _buildTitle(BuildContext context) {
    return Text(
      'Create an\nAccount',
      style: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  /// Name Input Field
  Widget _buildNameField() {
    return TextField(
      controller: _nameController,
      decoration: InputDecoration(
        labelText: 'Name',
        prefixIcon: const Icon(Icons.person_outline),
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

  /// Signup Button
  Widget _buildSignupButton() {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () {
          // Handle Sign-Up logic
        },
        child: Text(
          'Sign up',
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

  /// Login Button
  Widget _buildLoginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.teal,
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) => const LoginScreen()),
        ),
        child: Text(
          'Log in',
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
    );
  }
}
