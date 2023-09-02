import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Helper/color_pallet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Widgets/widgets.dart';
import './home_tab.dart';
import './username_creator.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  final emailCotroller = TextEditingController();
  final passwordController = TextEditingController();
  String emailError = '';
  String passwordError = '';
  bool showEmailSuffix = false;
  bool showPassword = false;
  bool makeObscure = true;
  bool receiveEmailAgreement = false;
  bool isLogin = false;
  final _auth = FirebaseAuth.instance;
  bool isLoading = false;
  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: SizedBox(
          width: 35,
          height: 35,
          child: Image.asset('assets/reddit.png'),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                isLogin = !isLogin;
              });
            },
            child: Text(isLogin == false ? 'Log in' : 'Sign up'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(children: [
          const SizedBox(height: 20),
          Center(
            child: Text(
              isLogin ? "Log in to Reddit" : 'Hi new friend, welcome to Reddit',
              style: const TextStyle(
                color: ColorPallets.normalTextColor,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 30),
          _buildSignInTile(
              text: 'Continue with Google',
              onClick: () async {
                try {
                  await AuthService().signInWithGoogle();
                } on FirebaseAuthException catch (error) {
                  redditSnackBar(
                    context: context,
                    message: error.message,
                    isHappy: false,
                  );
                } catch (error) {
                  redditSnackBar(
                    context: context,
                    message: error.toString(),
                    isHappy: false,
                  );
                }
              }),
          const SizedBox(height: 30),
          _buildDivider(),
          const SizedBox(height: 30),
          _buildEmailPasswordInput(),
        ]),
      ),
    );
  }

  _buildSignInTile({IconData? icon, String? text, Function()? onClick}) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 50,
      decoration: BoxDecoration(
        color: ColorPallets.rareButtonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
        onPressed: onClick,
        child: Row(children: [
          icon == null
              ? Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/googleg_standard_color_18.png')),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 20,
                  height: 20,
                  child: Icon(icon)),
          const SizedBox(width: 50),
          Text(
            text!,
            style: const TextStyle(
              fontSize: 17,
              color: ColorPallets.normalTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
    );
  }

  _buildEmailPasswordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInput(
            controller: emailCotroller,
            error: emailError,
            label: 'Email',
            suffixAction: () {
              emailCotroller.text = '';
              setState(() {
                emailError = '';
                showEmailSuffix = false;
              });
            },
            onChanged: (value) {
              if (value.isEmpty) {
                setState(() {
                  showEmailSuffix = false;
                });
              } else {
                setState(() {
                  showEmailSuffix = true;
                });
              }
              setState(() {
                emailError = '';
              });
            },
            onTabOutside: (pointer) {
              if (emailCotroller.text.isEmpty) {
                setState(() {
                  emailError = 'Email is Empty';
                });
              } else {
                if (!emailCotroller.text.isEmail) {
                  setState(() {
                    emailError = 'Not a valid email address';
                  });
                }
              }
            }),
        _buildInput(
            controller: passwordController,
            error: passwordError,
            label: 'Password',
            obscure: makeObscure,
            suffixAction: () {
              setState(() {
                showPassword = !showPassword;
                makeObscure = !makeObscure;
              });
            },
            onChanged: (value) {
              if (value.isEmpty) {
                setState(() {
                  passwordError = '';
                });
              }
              setState(() {
                passwordError = '';
              });
            },
            onTabOutside: (pointer) {
              if (passwordController.text.isEmpty) {
                setState(() {
                  passwordError = 'Password is Empty';
                });
              } else {
                if (passwordController.text.length < 8) {
                  setState(() {
                    passwordError = 'Password must be at least 8 characters';
                  });
                }
              }
            }),
        isLogin
            ? TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Passoword',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                  ),
                ))
            : Row(
                children: [
                  Checkbox(
                      value: receiveEmailAgreement,
                      onChanged: (value) {
                        setState(() {
                          receiveEmailAgreement = !receiveEmailAgreement;
                        });
                      }),
                  const Text(
                    'I agree to receive emails and cool stuff on Reddit',
                    style: TextStyle(
                      color: ColorPallets.normalTextColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
        const SizedBox(height: 30),
        Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isValid()
                ? const Color.fromARGB(255, 243, 83, 72)
                : ColorPallets.rareButtonColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: MaterialButton(
              onPressed: isValid()
                  ? () async {
                      await handleContinueButton();
                    }
                  : null,
              child: Text(
                'Continue',
                style: TextStyle(
                  color:
                      isValid() ? Colors.white : ColorPallets.normalTextColor,
                ),
              )),
        ),
      ],
    );
  }

  bool isValid() {
    if (isLogin == false) {
      if (emailCotroller.text.isNotEmpty &&
          emailCotroller.text.isEmail &&
          passwordController.text.isNotEmpty &&
          passwordController.text.length >= 8 &&
          receiveEmailAgreement == true) {
        return true;
      }
    } else {
      if (emailCotroller.text.isNotEmpty &&
          emailCotroller.text.isEmail &&
          passwordController.text.isNotEmpty &&
          passwordController.text.length >= 8) {
        return true;
      }
    }

    return false;
  }

  _buildDivider() {
    return Row(
      children: const [
        Expanded(
          child: Divider(),
        ),
        SizedBox(width: 15),
        Text('OR'),
        SizedBox(width: 15),
        Expanded(child: Divider()),
      ],
    );
  }

  _buildInput(
      {TextEditingController? controller,
      String? label,
      Function()? suffixAction,
      String? error,
      Function(String)? onChanged,
      Function(PointerDownEvent)? onTabOutside,
      bool? obscure}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 5),
          decoration: BoxDecoration(
            color: ColorPallets.rareButtonColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            keyboardType: label == 'Email' ? TextInputType.emailAddress : null,
            controller: controller,
            onChanged: onChanged,
            obscureText: obscure ?? false,
            onTapOutside: onTabOutside,
            style: const TextStyle(
              color: ColorPallets.normalTextColor,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              fillColor: Colors.blue,
              labelText: label,
              labelStyle: const TextStyle(
                color: Color.fromARGB(255, 110, 105, 105),
              ),
              border: InputBorder.none,
              suffixIcon: label == 'Email'
                  ? showEmailSuffix == true
                      ? IconButton(
                          onPressed: suffixAction,
                          icon: const Icon(
                            Icons.cancel_outlined,
                            size: 25,
                          ),
                          color: const Color.fromARGB(255, 114, 114, 114),
                        )
                      : null
                  : IconButton(
                      onPressed: suffixAction,
                      icon: Icon(
                        showPassword
                            ? FontAwesomeIcons.solidEyeSlash
                            : FontAwesomeIcons.solidEye,
                        size: 18,
                      ),
                      color: const Color.fromARGB(255, 114, 114, 114),
                    ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
          child: Text(
            error ?? '',
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  handleContinueButton() async {
    Get.dialog(const Center(child: LoadingAnimation()),
        barrierColor: Colors.black12);
    try {
      setState(() {
        isLoading = true;
      });
      if (isLogin == true) {
        await _auth.signInWithEmailAndPassword(
            email: emailCotroller.text, password: passwordController.text);
        Get.back();
        Get.back();
        Get.off(() => const Home());
      } else {
        await _auth.createUserWithEmailAndPassword(
            email: emailCotroller.text, password: passwordController.text);
        Get.back();
        Get.to(() => const UsernameCreator());
      }
    } on FirebaseAuthException catch (error) {
      Get.back();
      // ignore: use_build_context_synchronously
      redditSnackBar(context: context, message: error.message, isHappy: false);
    } on FirebaseException catch (error) {
      Get.back();
      // ignore: use_build_context_synchronously
      redditSnackBar(context: context, message: error.message, isHappy: false);
    } catch (error) {
      Get.back();
      // ignore: use_build_context_synchronously
      redditSnackBar(
          context: context, message: error.toString(), isHappy: false);
    }
    setState(() {
      isLoading = false;
    });
  }
}
