import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movie_explorer/core/constants/app_text_styles.dart';
import 'package:movie_explorer/features/home/presentation/view/home_view.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/password_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  late String email, password;

  bool _isFormValid = false;
  bool loading = false;

  void _validateForm() {
    setState(() {
      _isFormValid = _globalKey.currentState?.validate() ?? false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Stack(
        children: [
          Image.asset(
            width: double.infinity,
            height: double.infinity,
            "assets/sky.jpg",
            fit: BoxFit.fill,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Form(
                key: _globalKey,
                autovalidateMode: _autoValidateMode,
                onChanged: _validateForm,
                child: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 24),
                      Text(
                        "Movie Explorer",
                        style: AppTextStyles.heading1,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Discover and explore your favorite movies",
                        style: AppTextStyles.subtitle2,
                      ),
                      const SizedBox(height: 64),
                      CustomTextFormField(
                        onSaved: (value) {
                          email = value!;
                        },
                        hintText: "your@email.com",
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      const SizedBox(height: 16),
                      PasswordField(
                        onSaved: (value) {
                          password = value!;
                        },
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        onPressed: () {
                          if (_globalKey.currentState!.validate()) {
                            loading = true;
                            setState(() {});
                            Future.delayed(
                              const Duration(seconds: 3),
                              () {
                                loading = false;
                                setState(() {});
                                Navigator.pushReplacementNamed(context, HomeView.routeName);
                              },
                            );
                          } else {
                            setState(() {
                              _autoValidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                        title: "Login",
                        isEnabled: _isFormValid,
                      ),
                      const SizedBox(height: 33),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
