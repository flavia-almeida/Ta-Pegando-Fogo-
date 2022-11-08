import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ta_pegando_fogo/repositories/measurement_repository.dart';

final MeasurementRepositoryProvider =
    Provider((ref) => MeasurementRepository(ref.read));
