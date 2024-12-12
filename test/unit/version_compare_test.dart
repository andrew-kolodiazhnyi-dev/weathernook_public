import 'package:test/test.dart';
import 'package:weathernook/features/app_update/app_update_service/data/firebase_app_update_service.dart';

void main() {
  test(
    'isArrivedVersionNewer() method test, should be'
    'true if arrived version is bigger than current',
    () {
      final falseMap = [
        ('0.2.0', '0.3.0'),
        ('11.33.44', '22.55.66'),
        ('999.999.999', '1000.0.0'),
        ('999.999.999', '999.999.1000'),
        ('0.0.2', '1.0.0'),
        ('0.10.0', '1.10.0'),
      ];
      final trueMap = [
        ('0.3.0', '0.2.0'),
        ('11.66.44', '11.55.66'),
        ('1000.0.0', '999.999.999'),
        ('999.999.1000', '999.999.999'),
        ('1.0.2', '0.0.2'),
        ('11.0.2', '0.9999.2'),
      ];

      for (final value in falseMap) {
        expect(
          FirebaseAppUpdateService.isArrivedVersionNewer(
              arrived: value.$1, current: value.$2),
          false,
        );
      }

      for (final value in trueMap) {
        expect(
          FirebaseAppUpdateService.isArrivedVersionNewer(
              arrived: value.$1, current: value.$2),
          true,
        );
      }
    },
  );
}
