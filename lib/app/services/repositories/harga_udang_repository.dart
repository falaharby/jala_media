import 'package:jala_media/app/data/models/harga_udang_model.dart';
import 'package:jala_media/app/services/api.dart';

class HargaUdangRepository {
  Future<HargaUdang> getHargaUdang({int? page, String? regionId}) async {
    var res = await Api().get('/shrimp_prices', queryParameters: {
      'per_page': 15,
      'page': page,
      'with': 'region,creator',
      'region_id': regionId,
    });

    return HargaUdang.fromJson(res.data);
  }
}
