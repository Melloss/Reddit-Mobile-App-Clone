import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Views/avatar_selector.dart';
import '../Widgets/widgets.dart';
import '../Helper/color_pallet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UsernameCreator extends StatefulWidget {
  const UsernameCreator({super.key});

  @override
  State<UsernameCreator> createState() => _UsernameCreatorState();
}

class _UsernameCreatorState extends State<UsernameCreator> {
  final usernameController = TextEditingController();
  String usernameError = '';
  final User? user = FirebaseAuth.instance.currentUser;
  final userCollection = FirebaseFirestore.instance.collection('Users');
  bool isValid = false;

  checkValidity() async {
    String username = usernameController.text;
    if (username.length >= 6) {
      final snapshot = await userCollection.get();
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
          snapshot.docs;
      for (var document in documents) {
        final data = document.data();
        if (data['username'].toString().trim() == username) {
          setState(() {
            isValid = false;
            usernameError =
                'sorry, ${usernameController.text} is not available!';
          });
        } else {
          setState(() {
            isValid = true;
            usernameError = '${usernameController.text} is available!';
          });
        }
      }
    } else {
      setState(() {
        isValid = false;
        usernameError = 'username must be greater than 6 character';
      });
    }
  }

  void handleContinueButton() async {
    Get.dialog(const Center(child: LoadingAnimation()),
        barrierColor: Colors.black12);
    if (user != null) {
      try {
        String username = usernameController.text;
        await user?.updateDisplayName(username);
        await userCollection.doc(user?.uid).set({
          'username': username,
        });
        Get.back();
        usernameController.text = '';
        usernameError = '';
        Get.to(() => const AvatarSelector());
      } on FirebaseAuthException catch (error) {
        Get.back();
        redditSnackBar(
            context: context, isHappy: false, message: error.message);
      } on FirebaseException catch (error) {
        Get.back();
        redditSnackBar(
            context: context, isHappy: false, message: error.message);
      } catch (error) {
        Get.back();
        redditSnackBar(
            context: context, isHappy: false, message: error.toString());
      }
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset('assets/reddit.png', width: 40, height: 40),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Create your username',
              style: TextStyle(
                color: ColorPallets.normalTextColor,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Most redditors use an anonymous username. You won\'t able to change it later',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildInput(
              label: 'Username',
              controller: usernameController,
              error: usernameError,
              onChanged: (value) async {
                await checkValidity();
              },
              onTabOutside: (po) => {},
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: isValid
                    ? const Color.fromARGB(255, 243, 83, 72)
                    : ColorPallets.rareButtonColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: MaterialButton(
                  onPressed: isValid ? handleContinueButton : null,
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color:
                          isValid ? Colors.white : ColorPallets.normalTextColor,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  _buildInput(
      {TextEditingController? controller,
      String? label,
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
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
          child: Text(
            error ?? '',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: error == '${usernameController.text} is available!'
                  ? Colors.green
                  : Colors.red,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
