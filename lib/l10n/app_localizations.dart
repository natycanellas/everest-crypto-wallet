import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_pt.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('pt')
  ];

  /// título da página de portfólio
  ///
  /// In pt, this message translates to:
  /// **'Cripto'**
  String get cryptoTitle;

  /// No description provided for @cryptoSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Valor total de moedas'**
  String get cryptoSubtitle;

  /// No description provided for @portfolio.
  ///
  /// In pt, this message translates to:
  /// **'Portfólio'**
  String get portfolio;

  /// No description provided for @movimentations.
  ///
  /// In pt, this message translates to:
  /// **'Movimentações'**
  String get movimentations;

  /// No description provided for @details.
  ///
  /// In pt, this message translates to:
  /// **'Detalhes'**
  String get details;

  /// No description provided for @actualPrice.
  ///
  /// In pt, this message translates to:
  /// **'Preço atual'**
  String get actualPrice;

  /// No description provided for @dayVariation.
  ///
  /// In pt, this message translates to:
  /// **'Variação 24H'**
  String get dayVariation;

  /// No description provided for @quantity.
  ///
  /// In pt, this message translates to:
  /// **'Quantidade'**
  String get quantity;

  /// No description provided for @value.
  ///
  /// In pt, this message translates to:
  /// **'Valor'**
  String get value;

  /// No description provided for @convertCurrency.
  ///
  /// In pt, this message translates to:
  /// **'Converter moeda'**
  String get convertCurrency;

  /// No description provided for @convert.
  ///
  /// In pt, this message translates to:
  /// **'Converter'**
  String get convert;

  /// No description provided for @available.
  ///
  /// In pt, this message translates to:
  /// **'Saldo Disponível'**
  String get available;

  /// No description provided for @convertQuestion.
  ///
  /// In pt, this message translates to:
  /// **'Quanto você gostaria de converter?'**
  String get convertQuestion;

  /// No description provided for @insufficientFunds.
  ///
  /// In pt, this message translates to:
  /// **'Saldo insuficiente'**
  String get insufficientFunds;

  /// No description provided for @estimatedTotal.
  ///
  /// In pt, this message translates to:
  /// **'Total estimado'**
  String get estimatedTotal;

  /// No description provided for @review.
  ///
  /// In pt, this message translates to:
  /// **'Revisar'**
  String get review;

  /// No description provided for @reviewQuote.
  ///
  /// In pt, this message translates to:
  /// **'Revise os dados da sua conversão'**
  String get reviewQuote;

  /// No description provided for @toConvert.
  ///
  /// In pt, this message translates to:
  /// **'Converter'**
  String get toConvert;

  /// No description provided for @toReceive.
  ///
  /// In pt, this message translates to:
  /// **'Receber'**
  String get toReceive;

  /// No description provided for @exchangeRate.
  ///
  /// In pt, this message translates to:
  /// **'Câmbio'**
  String get exchangeRate;

  /// No description provided for @completeConversion.
  ///
  /// In pt, this message translates to:
  /// **'Concluir conversão'**
  String get completeConversion;

  /// No description provided for @conversionDone.
  ///
  /// In pt, this message translates to:
  /// **'Conversão efetuada'**
  String get conversionDone;

  /// No description provided for @conversionDoneQuote.
  ///
  /// In pt, this message translates to:
  /// **'Conversão da moeda efetuada com sucesso!'**
  String get conversionDoneQuote;

  /// No description provided for @noMovimentations.
  ///
  /// In pt, this message translates to:
  /// **'Nenhuma movimentação foi encontrada!'**
  String get noMovimentations;

  /// No description provided for @receipt.
  ///
  /// In pt, this message translates to:
  /// **'Comprovante da Movimentação'**
  String get receipt;

  /// No description provided for @currency.
  ///
  /// In pt, this message translates to:
  /// **'Moeda'**
  String get currency;

  /// No description provided for @source.
  ///
  /// In pt, this message translates to:
  /// **'Origem'**
  String get source;

  /// No description provided for @destination.
  ///
  /// In pt, this message translates to:
  /// **'Destino'**
  String get destination;

  /// No description provided for @movementDate.
  ///
  /// In pt, this message translates to:
  /// **'Data da operação'**
  String get movementDate;

  /// No description provided for @valueInReais.
  ///
  /// In pt, this message translates to:
  /// **'Valor em reais'**
  String get valueInReais;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'fr', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
