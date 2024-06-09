import 'package:get/get.dart';
import 'package:jala_media/app/data/models/penyakit_model.dart';
import 'package:jala_media/app/services/repositories/info_penyakit_repository.dart';

class InfoPenyakitController extends GetxController {
  RxList<DataPenyakit> listPenyakit = List<DataPenyakit>.empty().obs;

  // Pagination
  RxInt page = 1.obs;
  RxBool fetchLoading = false.obs;
  RxBool fetchNextLoading = false.obs;
  RxBool isNextPage = false.obs;

  RxInt webviewLoading = 0.obs;

  final repo = InfoPenyakitRepository();

  @override
  void onInit() {
    super.onInit();
    resetValue();
    fetchListPenyakit();
  }

  void fetchListPenyakit() async {
    if (listPenyakit.isEmpty) {
      fetchLoading.value = true;
    } else {
      fetchNextLoading.value = true;
    }

    await repo.getListPenyakit(page: page.value).then((res) {
      if (res.links?.next != null) {
        isNextPage.value = true;
        page.value += 1;
      } else {
        isNextPage.value = false;
      }
      listPenyakit.addAll(res.data ?? []);

      fetchNextLoading.value = false;
      fetchLoading.value = false;
    });
  }

  resetValue() {
    listPenyakit.value = [];
    page.value = 1;
    fetchLoading.value = false;
    fetchNextLoading.value = false;
    isNextPage.value = false;
  }
}
