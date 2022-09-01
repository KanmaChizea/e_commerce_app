import 'package:e_commerce_app/core/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/buttons.dart';
import '../../../core/theme/colors.dart';
import '../../domain/entity/address_entity.dart';
import '../bloc/address_bloc.dart';
import '../widgets/settings_appbar.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: kPadding.copyWith(bottom: 20),
        child: Column(
          children: [
            const SettingsAppBar(title: 'Your addresses'),
            const SizedBox(height: 32),
            BlocBuilder<AddressBloc, List<Address>>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        final address = state[index];
                        return ListTile(
                          title: Text(
                            '${address.firstName} ${address.lastName}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          subtitle: Text(
                            '${address.address}\n ${address.no}',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          isThreeLine: true,
                          trailing: IconButton(
                              onPressed: () => context
                                  .read<AddressBloc>()
                                  .add(DeleteAddress(address)),
                              icon: const Icon(
                                Icons.delete,
                                color: kPrimary,
                              )),
                          contentPadding: EdgeInsets.zero,
                        );
                      }),
                );
              },
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'add address'),
                style: fullButton.copyWith(
                  minimumSize: MaterialStateProperty.all(Size(size.width, 48)),
                ),
                child: Text(
                  'Add new address',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: kWhite),
                ))
          ],
        ),
      )),
    );
  }
}
