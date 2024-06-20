import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: Colors.grey.shade300,
          height: 1,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 12.0),
          child: Icon(
            Iconsax.notification,
            size: 25,
            color: Colors.grey,
          ),
        ),
      ],
      title: const Padding(
        padding: EdgeInsets.only(left: 0.0),
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  fillColor: Color(0xFFF3F2F7),
                  prefixIcon: Icon(
                    Iconsax.search_normal,
                    color: Colors.grey,
                    size: 25,
                  ),
                  hintText: 'Поиск товаров',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // AppBar balandligi
}
