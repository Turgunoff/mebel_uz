import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Iconsax.notification),
            onPressed: () {
              // Add your search functionality here
            },
          ),
        ],
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Войдите или зарегистрируйтесь, чтобы управлять историей заказов и сохранять товары в избранное',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.only(top: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Войти или Зарегистрироваться',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Iconsax.shop,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text(
                'Магазины',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              trailing: const Icon(
                Iconsax.arrow_right_3,
                color: Colors.grey,
              ),
            ),
            Divider(color: Colors.grey[100], height: 1),
            ListTile(
              leading: Icon(
                Iconsax.message,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text(
                'Связь с нами',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              trailing: const Icon(
                Iconsax.arrow_right_3,
                color: Colors.grey,
              ),
            ),
            Divider(color: Colors.grey[100], height: 1),
            ListTile(
              leading: Icon(
                Iconsax.link_1,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text(
                'Социалные сети',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              trailing: const Icon(
                Iconsax.arrow_right_3,
                color: Colors.grey,
              ),
            ),
            Divider(color: Colors.grey[100], height: 1),
            ListTile(
              leading: Icon(
                Iconsax.info_circle,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text(
                'О приложении',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              trailing: const Icon(
                Iconsax.arrow_right_3,
                color: Colors.grey,
              ),
            ),
            Divider(color: Colors.grey[100], height: 1),
          ],
        ),
      ),
    );
  }
}
