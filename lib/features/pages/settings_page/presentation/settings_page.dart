import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../common/services/storage_service/domain/storage_service.dart';
import '../../../../common/views/app_text_field.dart';
import '../../../../common/views/nook_app_bar.dart';
import '../../../../core/di/locator.dart';
import '../../../../core/l18n/strings.g.dart';
import '../../../../core/router/router.dart';
import '../../../../utils/toasts.dart';
import '../cubit/settings_page_cubit.dart';
import '../cubit/settings_page_state.dart';
import 'views/theme_selector.dart';

enum SettingsField {
  apiKey,
}

@RoutePage()
class SettingsPage extends StatelessWidget implements AutoRouteWrapper {
  const SettingsPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SettingsPageCubit>.value(
      value: locator<SettingsPageCubit>(),
      child: this,
    );
  }

  void _onStateChanged(BuildContext context, SettingsPageState state) {
    switch (state.status) {
      case SettingsPageStatus.success:
        context.toasts.showSuccess(
          message: strings.settingsPage.successApiKeyChange,
        );
        router.maybePop();
      case SettingsPageStatus.error:
        state.errorMessage.match(
          () {},
          (error) => context.toasts.showError(error),
        );
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsPageCubit, SettingsPageState>(
      listener: _onStateChanged,
      child: Scaffold(
        appBar: NookAppBar(
          title: Text(
            strings.settingsPage.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ExternalApiBody(),
                const SizedBox(height: 16),
                Text(
                  'Themes:',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                const ThemeSelector(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ExternalApiBody extends StatelessWidget {
  _ExternalApiBody();

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          strings.settingsPage.apiKeyText,
        ),
        FormBuilder(
          key: _formKey,
          child: AppTextField(
            name: SettingsField.apiKey.name,
            initialValue: locator<StorageService>().getExternalApiKey(),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.minLength(10),
              FormBuilderValidators.maxLength(256),
            ]),
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: () {
            final currentState = _formKey.currentState;
            if (currentState != null && currentState.validate()) {
              final key = currentState.instantValue[SettingsField.apiKey.name]
                  .toString();
              context.read<SettingsPageCubit>().tryKey(key);
            }
          },
          child: Text(strings.settingsPage.tryItButton),
        ),
      ],
    );
  }
}
