import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

enum SettingsPageStatus {
  idle,
  loading,
  success,
  error,
}

class SettingsPageState implements Equatable {
  final SettingsPageStatus status;
  final Option<String> errorMessage;
  final Option<String> externalApiKey;

  const SettingsPageState({
    required this.status,
    this.errorMessage = const Option.none(),
    this.externalApiKey = const Option.none(),
  });

  SettingsPageState copyWith({
    SettingsPageStatus? status,
    Option<String>? errorMessage,
    Option<String>? externalApiKey,
  }) {
    return SettingsPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      externalApiKey: externalApiKey ?? this.externalApiKey,
    );
  }

  @override
  List<Object> get props => [
        status,
        errorMessage,
        externalApiKey,
      ];

  @override
  bool get stringify => true;
}
