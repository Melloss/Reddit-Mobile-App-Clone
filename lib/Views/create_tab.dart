import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Helper/color_pallet.dart';

class CreateTab extends StatefulWidget {
  const CreateTab({super.key});

  @override
  State<CreateTab> createState() => _CreateTabState();
}

class _CreateTabState extends State<CreateTab> with ColorPallets {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _linkController = TextEditingController();
  bool isEmpty = true;
  bool showLinkInput = false;
  bool isLinkValid = true;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        leading: const SizedBox.shrink(),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            _buildTopButtons(),
            _buildTitleInput(),
            _buildLinkInput(),
            _buildTextOptional(),
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  _buildTitleInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: TextFormField(
        onChanged: (text) {
          if (text.isNotEmpty) {
            setState(() {
              isEmpty = false;
            });
          } else {
            setState(() {
              isEmpty = true;
            });
          }
        },
        style: const TextStyle(
          color: ColorPallets.normalTextColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        controller: _titleController,
        decoration:
            const InputDecoration(hintText: 'Title', border: InputBorder.none),
      ),
    );
  }

  _buildLinkInput() {
    return showLinkInput
        ? Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                TextField(
                  onChanged: (text) {
                    if (text.isNotEmpty && !text.isURL) {
                      setState(() {
                        isLinkValid = false;
                      });
                    } else {
                      setState(() {
                        isLinkValid = true;
                      });
                    }
                  },
                  style: const TextStyle(
                    color: ColorPallets.normalTextColor,
                    fontSize: 17,
                  ),
                  controller: _linkController,
                  decoration: InputDecoration(
                      suffixIcon: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: ColorPallets.rareButtonColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(
                          onPressed: () {
                            _linkController.text = "";

                            setState(() {
                              isEmpty = _titleController.text.isNotEmpty
                                  ? false
                                  : true;
                              isLinkValid = true;
                              showLinkInput = false;
                            });
                          },
                          icon: const Icon(
                            Icons.close_outlined,
                            color: ColorPallets.normalTextColor,
                          ),
                        ),
                      ),
                      hintText: 'URL',
                      border: InputBorder.none),
                ),
                isLinkValid
                    ? const SizedBox.shrink()
                    : Container(
                        height: 30,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 7),
                        decoration: BoxDecoration(
                          color: ColorPallets.rareButtonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text(
                            'Oops, this link isn\'t valid. Double-check,and try again.',
                            style: TextStyle(
                              color: ColorPallets.smallTextColor,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      )
              ],
            ),
          )
        : const SizedBox.shrink();
  }

  _buildTextOptional() {
    return Expanded(
      flex: 15,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextField(
          onChanged: (text) {
            //
          },
          style: const TextStyle(
            color: ColorPallets.normalTextColor,
            fontSize: 15,
          ),
          controller: _contentController,
          expands: true,
          minLines: null,
          maxLines: null,
          decoration: const InputDecoration(
              hintText: 'body text (optional)', border: InputBorder.none),
        ),
      ),
    );
  }

  _buildBottomButtons() {
    return Expanded(
        flex: 1,
        child: Container(
          margin: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
          child: Row(
            children: [
              IconButton(
                onPressed: showLinkInput
                    ? null
                    : () {
                        setState(() {
                          isEmpty = true;
                          showLinkInput = true;
                        });
                      },
                icon: Icon(
                  Icons.link_outlined,
                  color: showLinkInput
                      ? ColorPallets.smallTextColor.withOpacity(0.4)
                      : ColorPallets.smallTextColor,
                ),
              ),
              IconButton(
                onPressed: showLinkInput ? null : () {},
                icon: Icon(
                  Icons.image_outlined,
                  color: showLinkInput
                      ? ColorPallets.smallTextColor.withOpacity(0.4)
                      : ColorPallets.smallTextColor,
                ),
              ),
              IconButton(
                onPressed: showLinkInput ? null : () {},
                icon: Icon(
                  Icons.play_circle_outline,
                  color: showLinkInput
                      ? ColorPallets.smallTextColor.withOpacity(0.4)
                      : ColorPallets.smallTextColor,
                ),
              ),
              IconButton(
                onPressed: showLinkInput ? null : () {},
                icon: Icon(
                  Icons.format_list_numbered_outlined,
                  color: showLinkInput
                      ? ColorPallets.smallTextColor.withOpacity(0.4)
                      : ColorPallets.smallTextColor,
                ),
              ),
            ],
          ),
        ));
  }

  _buildTopButtons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: const Icon(
            Icons.close,
            color: ColorPallets.smallTextColor,
            size: 28,
          ),
          onPressed: () {
            if (_titleController.text.isNotEmpty ||
                _linkController.text.isNotEmpty ||
                _contentController.text.isNotEmpty) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      content: Container(
                        padding: const EdgeInsets.all(15),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Discard post submission?",
                                style: TextStyle(
                                  color: ColorPallets.normalTextColor,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      height: 40,
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: ColorPallets.rareButtonColor,
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text(
                                          "Cancel",
                                          style: TextStyle(
                                              color:
                                                  ColorPallets.normalTextColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      height: 40,
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red,
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          _titleController.clear();
                                          _contentController.clear();
                                          _linkController.clear();
                                          Get.back();
                                          Get.back();
                                        },
                                        child: const Text(
                                          "Discard",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Expanded(child: Container()),
                            ]),
                      ),
                    );
                  });
            } else {
              Get.back();
            }
          },
        ),
        Expanded(child: Container()),
        Container(
          width: 70,
          height: 38,
          margin: const EdgeInsets.only(right: 10, top: 5),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: isEmpty
                ? ColorPallets.rareButtonColor
                : ColorPallets.buttonBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextButton(
            onPressed: isEmpty == true ? null : () {},
            child: Center(
                child: Text(
              'Next',
              style: TextStyle(
                  color: isEmpty
                      ? ColorPallets.smallTextColor.withOpacity(0.5)
                      : Colors.white,
                  fontSize: 11),
            )),
          ),
        )
      ],
    );
  }
}
