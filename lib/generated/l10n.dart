// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Breaking News`
  String get TitleApp {
    return Intl.message(
      'Breaking News',
      name: 'TitleApp',
      desc: '',
      args: [],
    );
  }

  /// `Technology`
  String get LabelTec {
    return Intl.message(
      'Technology',
      name: 'LabelTec',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get LabelGen {
    return Intl.message(
      'General',
      name: 'LabelGen',
      desc: '',
      args: [],
    );
  }

  /// `Sports`
  String get LabelSpo {
    return Intl.message(
      'Sports',
      name: 'LabelSpo',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get Refresh {
    return Intl.message(
      'Refresh',
      name: 'Refresh',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get Done {
    return Intl.message(
      'Done',
      name: 'Done',
      desc: '',
      args: [],
    );
  }

  /// `Published At`
  String get PublishedAt {
    return Intl.message(
      'Published At',
      name: 'PublishedAt',
      desc: '',
      args: [],
    );
  }

  /// `News App`
  String get NewsApp {
    return Intl.message(
      'News App',
      name: 'NewsApp',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get DarkMode {
    return Intl.message(
      'Dark Mode',
      name: 'DarkMode',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get LightMode {
    return Intl.message(
      'Light Mode',
      name: 'LightMode',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get ChangeLanguage {
    return Intl.message(
      'Change Language',
      name: 'ChangeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Please Choice Language`
  String get ChoiceLanguage {
    return Intl.message(
      'Please Choice Language',
      name: 'ChoiceLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Something is Wrong !`
  String get SomethingIsWrong {
    return Intl.message(
      'Something is Wrong !',
      name: 'SomethingIsWrong',
      desc: '',
      args: [],
    );
  }

  /// `No Found Description`
  String get NoFoundDescription {
    return Intl.message(
      'No Found Description',
      name: 'NoFoundDescription',
      desc: '',
      args: [],
    );
  }

  /// `Search must not be empty`
  String get SearchMustNotBeEmpty {
    return Intl.message(
      'Search must not be empty',
      name: 'SearchMustNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `No Connection Available, Please Check Your Connection.`
  String get ErrorConnection {
    return Intl.message(
      'No Connection Available, Please Check Your Connection.',
      name: 'ErrorConnection',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
