import 'package:e_commerce_app/settings/data/repository/settings_repository.dart';
import 'package:e_commerce_app/settings/data/source/settings_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSettingsDataSource extends Mock implements SettingsDataSource {}

void main() {
  late SettingsRepository sut;
  late MockSettingsDataSource mockSettingsDataSource;

  setUp(() {
    mockSettingsDataSource = MockSettingsDataSource();
    sut = SettingsRepository(mockSettingsDataSource);
  });

  group('', () {});
}
