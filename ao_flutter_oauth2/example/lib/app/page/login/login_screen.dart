import 'package:ao_flutter_oauth2_example/app/page/login/login_view_model.dart';
import 'package:ao_flutter_oauth2_example/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../architecture/base_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBindingScope<LoginScreenViewModel>(
        onModelReady: (viewModel) {},
        builder: (context, viewModel, child) => Scaffold(
              body: _buildBody(viewModel),
            ));
  }

  Widget _buildBody(LoginScreenViewModel viewModel) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: 60.h),
          const Text('Login',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 60.h),
          TextField(
            onChanged: (value) {
              viewModel.email(value);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 20.h),
          TextField(
            onChanged: (value) {
              viewModel.password(value);
            },
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          SizedBox(height: 15.h),
          _buildControlSocialLogin(viewModel),
          SizedBox(height: 40.h),
          TextButton(
              onPressed: () {
                viewModel.login();
              },
              child: const Text('Login',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
          SizedBox(height: 20.h),
          TextButton(
              onPressed: () {
                viewModel.gotoSignUpScreen();
              },
              child: const Text('SignUp',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)))
        ]),
      ),
    );
  }

  Widget _buildControlSocialLogin(LoginScreenViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIconGoogle(viewModel),
        SizedBox(width: 10.w),
        _buildIconFacebook(viewModel)
      ],
    );
  }

  Widget _buildIconGoogle(LoginScreenViewModel viewModel) {
    return IconButton(
        onPressed: () {
          viewModel.loginWithGoogle();
        },
        icon: Image.asset(Images.goole,
            width: 48.w, height: 48.w, fit: BoxFit.fill));
  }

  Widget _buildIconFacebook(LoginScreenViewModel viewModel) {
    return IconButton(
        onPressed: () {
          viewModel.loginWithFacebook();
        },
        icon: Image.asset(Images.facebook,
            width: 48.w, height: 48.w, fit: BoxFit.fill));
  }
}
