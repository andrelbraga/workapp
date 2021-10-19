import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appName': 'WorkApp',
      'name': 'Name',
      'lastName': 'LastNamer',
      'document': 'Document',
      'title': 'Work App',
      'desc': 'FlutterDevs intent to deliver Flutter apps with '
          'high quality. We’ve adopted Design First attitude '
          'which helps us deliver applications of highest quality.',
    },
    'pt-br': {
      'appName': 'WorkApp',
      'name': 'Nome',
      'lastName': 'Sobrenome',
      'document': 'Documento',
      'title': 'Work App',
      'desc': 'Aplicativo desenvolvido multilinguagem.',
    },
  };

  String? get appName {
    return _localizedValues[locale.languageCode]!['appName'];
  }
  String? get appNameShort {
    return _localizedValues[locale.languageCode]!['appNameShort'];
  }
  String? get title {
    return _localizedValues[locale.languageCode]!['title'];
  }
  String? get desc {
    return _localizedValues[locale.languageCode]!['desc'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pt-br'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}