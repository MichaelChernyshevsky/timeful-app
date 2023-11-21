// ignore_for_file: lines_longer_than_80_chars, prefer_constructors_over_static_methods

import 'package:app_with_apps/core/exports/exports.dart';
import 'package:app_with_apps/core/localization/intl/messages_all_locales.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static AppLocalizations? _current;

  static AppLocalizations get current {
    _current ??= AppLocalizations();
    return _current!;
  }

  static Future<AppLocalizations> load(Locale locale) {
    final name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      _current = instance;
      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        AppLocalizations();
  }

  // auth
  String get signIn => Intl.message('Sign in');
  String get signUp => Intl.message('Sign up');
  String get next => Intl.message('Next');
  String get back => Intl.message('Back');
  String get go => Intl.message('go');
  String get setCountry => Intl.message('Set country');
  String get setName => Intl.message('Set name');
  String get setWalue => Intl.message('Set name');

  String get economy => Intl.message('Economy');
  String get todo => Intl.message('ToDo');

  String get empty => Intl.message('');
  // Drawer
  String get curse => Intl.message('Current Curse');
  // titles
  String get news => Intl.message('News');
  String get historyEconomy => Intl.message('historyEconomy');
  String get historyToDo => Intl.message('historyToDo');
  String get createTask => Intl.message('Create task');

  String get user => Intl.message('User');
  // splash screen
  String get pressToContinue => Intl.message('Press to continue');
  // sort
  String get sortAll => Intl.message('All');
  String get sortByDate => Intl.message('By date');
  String get sortMin => Intl.message('Min -> Max');
  String get sortMax => Intl.message('Max -> Min');
  // create
  String get add => Intl.message('Add');
  String get isSpending => Intl.message('Spending');
  String get isIncome => Intl.message('Income');

  String get addSpending => Intl.message('Add Spending');
  String get pasteTitle => Intl.message('Paste title');
  String get pasteCount => Intl.message('Paste count');
  String get description => Intl.message('Description');
  String get currentDate => Intl.message('Current date');
  String get anyway => Intl.message('Anyway');
  String get morning => Intl.message('Morning');
  String get day => Intl.message('Day');
  String get evening => Intl.message('Evening');

  String get pasteCountOnDay => Intl.message('Paste count on day');

  String get color => Intl.message('Color');

  // notification
  String get errorLoading => Intl.message('Error loading');
  String get errorAdding => Intl.message('Error adding');
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);
}
