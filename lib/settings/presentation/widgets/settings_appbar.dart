import 'package:flutter/material.dart';

import '../../../core/widgets/save_items_appbar.dart';

class SettingsAppBar extends StatelessWidget {
  const SettingsAppBar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_outlined)),
        const SizedBox(width: 12),
        Expanded(child: GeneralAppBar(title: title))
      ],
    );
  }
}
