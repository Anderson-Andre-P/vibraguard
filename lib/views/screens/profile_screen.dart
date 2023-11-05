import 'package:flutter/material.dart';
import 'package:vibraguard/core/helpers/resources.dart';

import '../../core/helpers/images/image_paths.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          R.string.aboutTitle,
          style: ThemeData.light().textTheme.bodyLarge,
        ),
        backgroundColor: R.colors.lightPrimaryBackgroundColor,
        elevation: 1,
        centerTitle: false,
        leading: IconButton(
          onPressed: () => {Navigator.pop(context, true)},
          icon: Icon(Icons.arrow_back, color: R.colors.lightIconColor),
        ),
      ),
      body: ListTile(
        title: Text(R.string.about),
        subtitle: Text(R.string.aboutSubtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          showAboutDialog(
            context,
          );
        },
      ),
    );
  }

  void showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(R.string.about),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImagePaths.logo,
                height: 64,
              ),
              const SizedBox(height: 16),
              Text(
                R.string.titleOfApp,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                R.string.appVersion,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                R.string.description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(R.string.appDescription),
              const SizedBox(height: 16),
              Text(
                R.string.developedBy,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(R.string.autor),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(R.string.close),
            ),
          ],
        );
      },
    );
  }
}
