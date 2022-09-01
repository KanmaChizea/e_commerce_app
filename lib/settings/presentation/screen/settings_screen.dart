import 'package:flutter/material.dart';

import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/widgets/buttom_navigation_bar.dart';
import 'package:e_commerce_app/core/widgets/save_items_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../bloc/address_bloc.dart';
import '../widgets/settings_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ButtomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: kPadding,
          child: Column(
            children: [
              const GeneralAppBar(title: 'Account'),
              SettingsTile(
                  title: 'Personal details',
                  onPressed: () {
                    return Navigator.of(context).pushNamed('details');
                  },
                  trailing: true),
              SettingsTile(
                  title: 'Address book',
                  onPressed: () {
                    context.read<AddressBloc>().add(LoadAddress());
                    return Navigator.of(context).pushNamed('address');
                  },
                  trailing: true),
              SettingsTile(
                  title: 'Change password',
                  onPressed: () {
                    return Navigator.of(context).pushNamed('change password');
                  },
                  trailing: true),
              SettingsTile(
                  title: 'Logout',
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthLogout());
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('login', (route) => false);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
