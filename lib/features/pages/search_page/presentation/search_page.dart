import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../api/models/location.dart';
import '../../../../common/services/storage_service/domain/storage_service.dart';
import '../../../../common/views/app_text_field.dart';
import '../../../../common/views/nook_app_bar.dart';
import '../../../../core/di/locator.dart';
import '../../../../core/l18n/strings.g.dart';
import '../../../../core/router/router.dart';
import '../../../../utils/debouncer.dart';
import '../../../../utils/toasts.dart';
import '../cubit/search_page_cubit.dart';
import '../cubit/search_page_state.dart';

final _debouncer = Debouncer(milliseconds: 500);

enum SearchField {
  search,
}

@RoutePage()
class SearchPage extends StatelessWidget implements AutoRouteWrapper {
  const SearchPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<SearchPageCubit>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NookAppBar(
        title: Text(
          strings.searchPage.title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SearchField(),
            Expanded(
              child: _Suggestions(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Suggestions extends StatelessWidget {
  const _Suggestions();

  void _onStateChanged(BuildContext context, SearchPageState state) {
    switch (state.status) {
      case SearchPageStatus.error:
        state.errorMessage.match(
          () {},
          (error) => context.toasts.showError(error),
        );
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchPageCubit, SearchPageState>(
      listener: _onStateChanged,
      builder: (context, state) {
        return state.locations.match(
          () => const _OnNoneLocationsView(),
          (List<Location> locations) => _OnSomeLocationsView(locations),
        );
      },
    );
  }
}

class _OnNoneLocationsView extends StatelessWidget {
  const _OnNoneLocationsView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        strings.searchPage.pleaseEnterOrMoreCharacters(
          amount: minimalQueryLength,
        ),
        style: Theme.of(context).textTheme.titleSmall,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _OnSomeLocationsView extends StatelessWidget {
  final List<Location> locations;

  const _OnSomeLocationsView(this.locations);

  Future<void> _onItemTap(Location location) async {
    await locator<StorageService>().setLocation(location);
    router.replaceHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return locations.isEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              strings.searchPage.nothingWasFound,
              style: Theme.of(context).textTheme.titleSmall,
              overflow: TextOverflow.ellipsis,
            ),
          )
        : ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  final location = locations[index];
                  _onItemTap(location);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  child: Text(
                    locations[index].toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      name: SearchField.search.name,
      validator: FormBuilderValidators.city(),
      decoration: InputDecoration(
        icon: SizedBox(
          width: 24,
          child: BlocBuilder<SearchPageCubit, SearchPageState>(
            builder: (context, state) {
              if (state.status == SearchPageStatus.loading) {
                return SpinKitThreeBounce(
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                );
              } else {
                return FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Theme.of(context).colorScheme.primary,
                );
              }
            },
          ),
        ),
        contentPadding: const EdgeInsets.only(bottom: 10),
        border: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      onChanged: (query) {
        _debouncer.run(
          () async {
            return context.read<SearchPageCubit>().searchLocation(query);
          },
        );
      },
    );
  }
}
