import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/buttons.dart';
import '../../../core/theme/colors.dart';
import '../bloc/auth_bloc.dart';

class AuthScreenLayout extends StatelessWidget {
  final Widget child;
  final String title;
  final String header;
  final String subheader;
  final GlobalKey<FormState> formKey;
  final String elevatedButtonText;
  final Function()? elevatedButtonFunction;
  final String labelText;
  final String textButtonText;
  final void Function()? textButtonFunction;

  const AuthScreenLayout({
    Key? key,
    required this.child,
    required this.title,
    required this.header,
    required this.subheader,
    required this.formKey,
    required this.elevatedButtonText,
    this.elevatedButtonFunction,
    required this.labelText,
    required this.textButtonText,
    this.textButtonFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        padding:
            EdgeInsets.symmetric(horizontal: 16, vertical: size.height / 8),
        alignment: Alignment.centerLeft,
        width: size.width,
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO: add logo
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: kWhite),
            )
          ],
        ),
      ),
      Positioned(
          top: size.height / 4,
          child: Container(
              width: size.width,
              height: size.height * 0.75,
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              decoration: const BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: ListView(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(header,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(color: kPrimary)),
                    const SizedBox(height: 4),
                    Text(
                      subheader,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: kGrey),
                    ),
                    const SizedBox(height: 32),
                    Form(
                      key: formKey,
                      child: Column(children: [
                        child,
                        const SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: elevatedButtonFunction,
                            style: fullButton.copyWith(
                              minimumSize: MaterialStateProperty.all(
                                  Size(size.width, 48)),
                            ),
                            child: BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                if (state is AuthInitial) {
                                  if (state.isLoading) {
                                    return const CircularProgressIndicator(
                                        color: kWhite);
                                  }

                                  return Text(
                                    elevatedButtonText,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        ?.copyWith(color: kWhite),
                                  );
                                }
                                return Container();
                              },
                            )),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(labelText),
                            TextButton(
                                onPressed: textButtonFunction,
                                child: Text(
                                  textButtonText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(color: kPrimary),
                                ))
                          ],
                        )
                      ]),
                    ),
                  ])))
    ]);
  }
}
