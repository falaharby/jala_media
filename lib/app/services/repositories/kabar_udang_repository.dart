import 'package:jala_media/app/data/models/kabar_udang_model.dart';
import 'package:jala_media/app/services/api.dart';

class KabarUdangRepository {
  Future<KabarUdang> getKabarUdang({int? page}) async {
    var res = await Api().get(
      '/posts',
      queryParameters: {
        'per_page': 15,
        'page': page,
        'with': 'creator',
      },
    );

    return KabarUdang.fromJson(res.data);
  }
}
