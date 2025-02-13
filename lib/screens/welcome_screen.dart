import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_screen_ui/screens/signup_screen.dart';
import 'package:login_screen_ui/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to MyApp',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 250.h),
            _buildTitle(context),
            SizedBox(height: 20.h),
            _buildDescription(),
            SizedBox(height: 180.h),
            _buildButtons(context),
          ],
        ),
      ),
    );
  }

  /// Title Section
  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w), // Responsive padding
      child: Text(
        'Stay Focused, Stay Productive!',
        style: TextStyle(
          fontSize: 28.sp, // Responsive text size
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  /// Description Text
  Widget _buildDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Text(
        'Log in or Sign up to start your journey. Manage tasks efficiently and stay on top of your goals!',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 16.sp, // Responsive text
          color: Color.fromARGB(255, 85, 85, 85),
        ),
      ),
    );
  }

  /// Login & Signup Buttons
  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          _buildButton(
            text: 'Log in',
            fontSize: 18.sp,
            backgroundColor: Colors.white,
            foregroundColor: Colors.teal,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => const LoginScreen()),
            ),
          ),
          SizedBox(height: 16.h),
          _buildButton(
            text: 'Sign up',
            fontSize: 18.sp,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => SignupScreen()),
            ),
          ),
        ],
      ),
    );
  }

  /// Reusable Elevated Button
  Widget _buildButton({
    required String text,
    required double fontSize,
    Color backgroundColor = Colors.teal,
    Color foregroundColor = Colors.white,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
}
