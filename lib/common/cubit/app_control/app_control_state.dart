// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_control_cubit.dart';

enum AppControlStatus { idle, error }

class AppControlState implements Equatable {
  final AppControlStatus status;
  final WeathernookThemeMode themeMode;
  final Option<String> errorMessage;

  const AppControlState({
    required this.status,
    required this.themeMode,
    this.errorMessage = const Option.none(),
  });

  @override
  List<Object> get props => [
        status,
        themeMode,
        errorMessage,
      ];

  @override
  bool get stringify => true;

  AppControlState copyWith({
    AppControlStatus? status,
    WeathernookThemeMode? themeMode,
    Option<String>? errorMessage,
  }) {
    return AppControlState(
      status: status ?? this.status,
      themeMode: themeMode ?? this.themeMode,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
