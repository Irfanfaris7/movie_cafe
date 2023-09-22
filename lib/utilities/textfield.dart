import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/provider.dart';

class Textfield2 extends ConsumerWidget {
  const Textfield2({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      obscureText: ref.watch(visibleProvider),
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                ref.read(visibleProvider.notifier).state =
                    !ref.read(visibleProvider.notifier).state;
              },
              icon: ref.watch(visibleProvider)
                  ? const Icon(
                      Icons.visibility_off,
                      color: Color.fromARGB(141, 0, 0, 0),
                    )
                  : const Icon(Icons.visibility,
                      color: Color.fromARGB(141, 0, 0, 0))),
          hintText: 'enter password',
          labelText: 'password',
          labelStyle: const TextStyle(color: Color.fromARGB(223, 0, 0, 0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 225, 46, 33))),
          prefixIcon: const Icon(Icons.lock),
          prefixIconColor: const Color.fromARGB(141, 0, 0, 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}

class Textfield1 extends StatelessWidget {
  const Textfield1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: 'enter email or phone',
          labelText: 'Email or Phone',
          labelStyle: const TextStyle(color: Color.fromARGB(223, 0, 0, 0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 225, 46, 33))),
          prefixIcon: const Icon(Icons.email),
          prefixIconColor: const Color.fromARGB(141, 0, 0, 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
