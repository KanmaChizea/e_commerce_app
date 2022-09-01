import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/widgets/text_field.dart';
import 'package:e_commerce_app/settings/domain/entity/address_entity.dart';
import 'package:e_commerce_app/settings/presentation/bloc/address_bloc.dart';
import 'package:e_commerce_app/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/buttons.dart';
import '../../../core/theme/colors.dart';
import '../widgets/settings_appbar.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController addressController;
  late TextEditingController phoneController;

  @override
  void initState() {
    firstNameController = TextEditingController.fromValue(
        TextEditingValue(text: context.read<SettingsBloc>().state.firstName));
    lastNameController = TextEditingController.fromValue(
        TextEditingValue(text: context.read<SettingsBloc>().state.lastName));
    addressController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: kPadding,
        child: Column(children: [
          const SettingsAppBar(title: 'Add new address'),
          const SizedBox(height: 32),
          Form(
              child: Column(children: [
            InputField(controller: firstNameController, label: 'First name'),
            const SizedBox(height: 24),
            InputField(controller: lastNameController, label: 'Last name'),
            const SizedBox(height: 24),
            InputField(
                controller: addressController, label: 'Delivery address'),
            const SizedBox(height: 24),
            InputField(
                controller: phoneController, label: 'Mobile phone number'),
            const SizedBox(height: 24),
          ])),
          ElevatedButton(
              onPressed: () {
                final address = Address(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    address: addressController.text,
                    no: phoneController.text);
                context.read<AddressBloc>().add(AddAddress(address));
                Navigator.pop(context);
              },
              style: fullButton.copyWith(
                minimumSize: MaterialStateProperty.all(Size(size.width, 48)),
              ),
              child: Text(
                'Save',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: kWhite),
              ))
        ]),
      )),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
