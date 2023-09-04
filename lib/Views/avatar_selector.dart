import 'package:flutter/material.dart';
import 'package:reddit_mobile_app_clone/Helper/color_pallet.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Widgets/widgets.dart' show redditSnackBar;
import 'package:get/get.dart';
import './home_tab.dart';

class AvatarSelector extends StatefulWidget {
  const AvatarSelector({super.key});

  @override
  State<AvatarSelector> createState() => _AvatarSelectorState();
}

class _AvatarSelectorState extends State<AvatarSelector> {
  int currentIndex = 0;
  final carouselController = CarouselController();
  final usersCollection = FirebaseFirestore.instance.collection('Users');
  final user = FirebaseAuth.instance.currentUser;

  handleContinueButton({bool isSkip = false}) async {
    try {
      await usersCollection.doc(user!.uid).update({
        'avatar_logo': isSkip == true ? '0.png' : '${currentIndex + 1}.png',
      });
      // ignore: use_build_context_synchronously
      redditSnackBar(
          context: context,
          isHappy: true,
          message: 'Account Created Successfully');
      Get.offAll(() => const Home());
    } catch (error) {
      redditSnackBar(
          context: context, isHappy: false, message: error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              handleContinueButton(isSkip: true);
            },
            child: const Text("Skip"),
          ),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTop(),
            _buildCarosel(),
            _buildCaroselBullets(),
            Expanded(child: Container()),
            _buildContinueButton(),
          ],
        ),
      ),
    );
  }

  _buildCarosel() {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: CarouselSlider(
            carouselController: carouselController,
            items: [
              _buildSlide('assets/avatars/1.png'),
              _buildSlide('assets/avatars/2.png'),
              _buildSlide('assets/avatars/3.png'),
              _buildSlide('assets/avatars/4.png'),
              _buildSlide('assets/avatars/5.png'),
            ],
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
              height: 300,
              padEnds: false,
              viewportFraction: 1.3,
            )),
      ),
      _buldSlideButton(
          left: true,
          onClick: () {
            carouselController.previousPage(
                duration: const Duration(milliseconds: 500));
          }),
      _buldSlideButton(
          left: false,
          onClick: () {
            carouselController.nextPage(
                duration: const Duration(milliseconds: 500));
          }),
    ]);
  }

  _buildSlide(String path) {
    return Image.asset(
      path,
      scale: 1,
      fit: BoxFit.cover,
    );
  }

  _buildCaroselBullets() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildBullet(0),
          _buildBullet(1),
          _buildBullet(2),
          _buildBullet(3),
          _buildBullet(4),
        ],
      ),
    );
  }

  _buildBullet(int index) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: currentIndex == index
            ? Colors.black.withOpacity(0.5)
            : Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: currentIndex == index
          ? null
          : Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
    );
  }

  _buldSlideButton({required bool left, Function()? onClick}) {
    return Positioned(
      top: 180,
      left: left ? 10 : null,
      right: left ? null : 10,
      child: InkWell(
        onTap: onClick,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          alignment: Alignment.center,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(0.3),
              width: 1,
            ),
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
            left ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _buildTop() {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          'Avatar',
          style: TextStyle(
            color: ColorPallets.normalTextColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Select your very first Collectible Avatar',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorPallets.normalTextColor.withOpacity(0.5),
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  _buildContinueButton() {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 50,
      margin: const EdgeInsets.only(bottom: 30),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 209, 64, 53),
        borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
        onPressed: handleContinueButton,
        child: const Text(
          'Continue',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
