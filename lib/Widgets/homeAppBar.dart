import 'package:flutter/material.dart';

buildHomeAppBar() {
  return AppBar(
    title: buildTitle(),
    actions: [
      Padding(
        padding: const EdgeInsets.all(5),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(right: 15, left: 5),
          child: CircleAvatar(
            maxRadius: 15,
            child: Stack(children: [
              Image.asset('assets/reddit.png'),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
            ]),
          ))
    ],
  );
}

Widget buildTitle() {
  return Container(
    width: 110,
    height: 35,
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration: BoxDecoration(
      color: const Color(0xFFECECEC),
      borderRadius: BorderRadius.circular(5),
    ),
    child: const ComboBoxMenu(),
  );
}

class ComboBoxMenu extends StatefulWidget {
  const ComboBoxMenu({super.key});
  @override
  State<ComboBoxMenu> createState() => _ComboBoxMenuState();
}

class _ComboBoxMenuState extends State<ComboBoxMenu> {
  String selectedItem = "Home";
  final menuItems = const ["Home", "Popular", "Watch", "Latest"];
  bool isArrowDown = true;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      underline: const SizedBox.shrink(),
      icon: isArrowDown
          ? const Icon(Icons.keyboard_arrow_down)
          : const Icon(Icons.keyboard_arrow_up),
      isExpanded: true,
      items: menuItems.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      value: selectedItem,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 17,
      ),
      onTap: () {
        setState(() {
          isArrowDown = false;
        });
      },
      onChanged: ((newValue) {
        setState(() {
          isArrowDown = true;
          selectedItem = newValue.toString();
        });
      }),
    );
  }
}
