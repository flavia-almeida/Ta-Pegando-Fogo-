import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ta_pegando_fogo/Providers/providers.dart';
import 'package:ta_pegando_fogo/Providers/repositories_providers.dart';
import 'package:ta_pegando_fogo/models/History_Device.dart';
import 'package:ta_pegando_fogo/repositories/measurement_repository.dart';
import '../models/auth_response.dart';
import '../repositories/login_repository.dart';

class MeasurementNotifier
    extends StateNotifier<AsyncValue<List<Measurement>?>> {
  final Reader reader;
  //final _measurement_repository = MeasurementRepository();

  MeasurementNotifier(this.reader) : super(AsyncValue.data(List.empty()));

  Future<void> GetMeasurement(String userId) async {
    try {
      state = const AsyncValue.loading();
      state = AsyncValue.data(
          await reader(MeasurementRepositoryProvider).GetMeasurement(userId));
    } catch (e) {
      state = AsyncValue.error(e.toString());
    }
  }
}
