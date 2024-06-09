import 'package:jala_media/app/data/models/penyakit_model.dart';
import 'package:jala_media/app/services/api.dart';
import 'package:jala_media/app/utils/config.dart';

class InfoPenyakitRepository {
  final api = Api();

  Future<Penyakit> getListPenyakit({int? page}) async {
    api.token = TOKEN;

    var res = await api.get(
      '/diseases',
      queryParameters: {
        'per_page': 15,
        'page': page,
      },
      addRequestInterceptor: true,
    );

    return Penyakit.fromJson(res.data);
  }
}
