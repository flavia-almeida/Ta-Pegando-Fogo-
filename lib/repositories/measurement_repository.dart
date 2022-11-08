import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ta_pegando_fogo/models/History_Device.dart';

import '../models/auth_response.dart';
import '../repositories/base_repository.dart';

class MeasurementRepository extends ProviderRepositoryBase {
  MeasurementRepository(Reader reader) : super(reader);

  Future<List<Measurement>> GetMeasurement(String user_id) async {
    var response =
        await dio.get<List<dynamic>>('/api/v1/users/${user_id}/fires');

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response.data!
          .map((element) => Measurement.fromJson(element))
          .toList();
    }

    throw Exception('Falha ao listar historico - ${response.statusCode}');
  }
}
