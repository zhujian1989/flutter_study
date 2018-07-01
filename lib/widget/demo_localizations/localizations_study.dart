import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StudyLocalizations {
  StudyLocalizations(this.locale);

  final Locale locale;

  static StudyLocalizations of(BuildContext context) {
    return Localizations.of<StudyLocalizations>(context, StudyLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'FlutterStudy',
    },
    'zh': {
      'appTitle': 'Flutter学习',
    },
  };

  String get appTitle {
    print(locale.languageCode);
    return _localizedValues[locale.languageCode]['appTitle'];
  }
}

class StudyLocalizationsDelegate
    extends LocalizationsDelegate<StudyLocalizations> {
  const StudyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<StudyLocalizations> load(Locale locale) {
    return new SynchronousFuture<StudyLocalizations>(
        new StudyLocalizations(locale));
  }

  @override
  bool shouldReload(StudyLocalizationsDelegate old) => false;

  static StudyLocalizationsDelegate delegate =
      const StudyLocalizationsDelegate();
}
