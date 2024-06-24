import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mebel_uz/core/presentation/utils/sized_box_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      width: MediaQuery.sizeOf(context).width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            isDismissible: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8),
              ),
            ),
            context: context,
            builder: (context) => Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Связаться с нами',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  12.kH,
                  ListTile(
                    leading: Icon(Iconsax.call,
                        color: Theme.of(context).primaryColor),
                    title: const Text(
                      'Позвонить нам',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onTap: () async {
                      // Telefon raqamini bu yerga kiriting
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: '+998946433733',
                      );
                      if (await canLaunchUrl(launchUri)) {
                        await launchUrl(launchUri);
                      } else {
                        throw 'Could not launch $launchUri';
                      }
                      Navigator.pop(context);
                    },
                  ),
                  Divider(
                    color: Colors.grey[300],
                    height: 1,
                  ),
                  ListTile(
                    leading: Icon(Iconsax.message,
                        color: Theme.of(context).primaryColor),
                    title: const Text(
                      'Telegram',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onTap: () async {
                      final Uri launchUri = Uri(
                        scheme: 'https',
                        path: 't.me/e_turgunoff',
                      );
                      if (await canLaunchUrl(launchUri)) {
                        await launchUrl(launchUri);
                      } else {
                        throw 'Could not launch $launchUri';
                      }
                      Navigator.pop(context);
                    },
                  ),
                  12.kH,
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Закрить',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).primaryColor,
              ),
              child: const Icon(
                Iconsax.call,
                color: Colors.white,
                size: 36,
              ),
            ),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Связаться с нами',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'По любым вопросам',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Iconsax.arrow_right_3,
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
