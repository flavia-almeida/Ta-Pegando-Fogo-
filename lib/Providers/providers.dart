import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ta_pegando_fogo/models/History_Device.dart';
import 'package:ta_pegando_fogo/notifiers/measurement_notifier.dart';
import '../models/auth_response.dart';
import '../notifiers/auth_notifier.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<AuthResponse?>>(
        (ref) => AuthNotifier());

final measurementProvider =
    StateNotifierProvider<MeasurementNotifier, AsyncValue<List<Measurement>?>>(
        (ref) => MeasurementNotifier(ref.read));
