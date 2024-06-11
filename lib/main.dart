import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jala_media/app/utils/theme.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://adf1e2f15573583670187ad68206e56d@o4507410430492672.ingest.us.sentry.io/4507410432589824';
      options.tracesSampleRate = 1.0;
      options.profilesSampleRate = 1.0;
    },
    appRunner: () async {
      WidgetsFlutterBinding.ensureInitialized();
      await initializeDateFormatting('id_ID', null).then(
        (_) => runApp(
          GetMaterialApp(
            title: "Jala Media",
            theme: AppTheme.appTheme,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          ),
        ),
      );
    },
  );
}
