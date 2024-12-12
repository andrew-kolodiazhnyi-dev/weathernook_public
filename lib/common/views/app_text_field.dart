import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppTextField extends StatelessWidget {
  final String name;
  final Widget? icon;
  final ValueSetter<String?>? onChanged;
  final String? initialValue;
  final InputDecoration? decoration;
  final FormFieldValidator<String>? validator;

  const AppTextField({
    super.key,
    required this.name,
    this.icon,
    this.onChanged,
    this.initialValue,
    this.decoration,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      cursorWidth: 12,
      initialValue: initialValue,
      cursorColor: Theme.of(context).colorScheme.secondary,
      autofocus: true,
      maxLines: 1,
      textAlignVertical: TextAlignVertical.center,
      decoration: decoration ??
          InputDecoration(
            icon: icon,
            contentPadding: const EdgeInsets.only(bottom: 10),
            border: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
      style: Theme.of(context).textTheme.titleLarge,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
