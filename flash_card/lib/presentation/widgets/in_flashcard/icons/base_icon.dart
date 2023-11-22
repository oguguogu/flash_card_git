import 'package:flutter/material.dart';

class BaseIcon extends StatelessWidget {
  const BaseIcon(
      {super.key,
      required this.text,
      required this.picture,
      required this.onTap});
  final String text;
  final String picture;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 110,
      child: Column(
        children: [
          InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: onTap,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(3, 6), // changes position of shadow
                    ),
                  ],
                  //shape: BoxShape.circle, // 丸い形にしたい場合
                  borderRadius: BorderRadius.circular(10), // 角丸の四角形にしたい場合
                  image: DecorationImage(
                    image: AssetImage(picture),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Text(text,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
