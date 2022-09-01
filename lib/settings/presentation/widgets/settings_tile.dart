import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key? key,
    required this.title,
    required this.onPressed,
    this.trailing = false,
  }) : super(key: key);

  final String title;
  final Function() onPressed;
  final bool trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      trailing: trailing
          ? const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
            )
          : null,
      onTap: onPressed,
    );
  }
}
