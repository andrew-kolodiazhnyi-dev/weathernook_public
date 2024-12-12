///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final strings = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get appName => 'Weathernook';
	late final TranslationsExceptionsEn exceptions = TranslationsExceptionsEn.internal(_root);
	late final TranslationsErrorEn error = TranslationsErrorEn.internal(_root);
	late final TranslationsFirstLaunchDialogEn firstLaunchDialog = TranslationsFirstLaunchDialogEn.internal(_root);
	late final TranslationsHomePageEn homePage = TranslationsHomePageEn.internal(_root);
	late final TranslationsSearchPageEn searchPage = TranslationsSearchPageEn.internal(_root);
	late final TranslationsSettingsPageEn settingsPage = TranslationsSettingsPageEn.internal(_root);
	late final TranslationsAirQualityModelEn airQualityModel = TranslationsAirQualityModelEn.internal(_root);
	late final TranslationsAppUpdateEn appUpdate = TranslationsAppUpdateEn.internal(_root);
}

// Path: exceptions
class TranslationsExceptionsEn {
	TranslationsExceptionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get noInternetConnectionException => 'No Internet Connection';
	String get unknownApiException => 'Oops something went wrong';
}

// Path: error
class TranslationsErrorEn {
	TranslationsErrorEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get oops => 'Ooops, something went wrong!';
}

// Path: firstLaunchDialog
class TranslationsFirstLaunchDialogEn {
	TranslationsFirstLaunchDialogEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Please read it carefuly';
	String get content => '1. If you experience an API Key error, you can set up your own on the Settings page. There will be a short description of how to do it\n\n2. If you have any questions or want to report a bug, please visit theengineer.dev and send a message from the Contact page\n\n3. You\'ll find a roadmap on my GitHub page, which is linked on theengineer.dev\n\nHave fun!';
}

// Path: homePage
class TranslationsHomePageEn {
	TranslationsHomePageEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get setLocationMenuItem => 'Set location';
	String get settingsMenuItem => 'Settings';
	late final TranslationsHomePageWeatherContentEn weatherContent = TranslationsHomePageWeatherContentEn.internal(_root);
}

// Path: searchPage
class TranslationsSearchPageEn {
	TranslationsSearchPageEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Choose a location';
	String get nothingWasFound => 'Nothing was found.';
	String pleaseEnterOrMoreCharacters({required int amount}) => 'Please enter ${amount} or more characters.';
}

// Path: settingsPage
class TranslationsSettingsPageEn {
	TranslationsSettingsPageEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	String get apiKeyText => 'If, for any reason, the API does not work, you can use your own API key. Go to https://www.weatherapi.com/, create an account, and get your own key. Then, enter it in the field below and press \'Try it out.\'';
	String get tryItButton => 'Try it out!';
	String get successApiKeyChange => 'Api Key was successfuly changed!';
}

// Path: airQualityModel
class TranslationsAirQualityModelEn {
	TranslationsAirQualityModelEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get good => 'Good';
	String get moderate => 'Moderate';
	String get unhealthyForSensitiveGroup => 'Unhealthy for sensitive group';
	String get unhealthy => 'Unhealthy';
	String get veryUnhealthy => 'Very unhealthy';
	String get hazardous => 'Hazardous';
	String get unknown => 'Unknown';
}

// Path: appUpdate
class TranslationsAppUpdateEn {
	TranslationsAppUpdateEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get titleRequired => 'Update Required';
	String get titleSuggested => 'Update Available';
	String get textRequired => 'To continue using app, please go to the store and download the newest version.';
	String get textSuggested => 'A new version of the app is ready for you! Update to the latest app to access the newest features and improvements.';
	String get updateNowButton => 'Update Now';
}

// Path: homePage.weatherContent
class TranslationsHomePageWeatherContentEn {
	TranslationsHomePageWeatherContentEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get serverDataUpdatedOn => 'Server data\nupdated on:';
	String get currentTemp => 'Current temp:';
	String temperature({required Object c, required Object f}) => '${c} ℃, ${f} ℉';
	String get feelsLike => 'Feels like:';
	String get sky => 'Sky:';
	String httpUrlPrefix({required Object url}) => 'https:${url}';
	String get windDirection => 'Wind direction:';
	String get windSpeed => 'Wind speed:';
	String speed({required Object kph, required Object mph}) => '${kph} kph, ${mph} mph';
	String get humidity => 'Humidity: ';
	String percentage({required Object data}) => '${data} %';
	String get airQuality => 'Air quality';
	String mgM3({required Object data}) => '${data} μg/m3';
	String get carbonMonoxide => 'co (Carbon Monoxide): ';
	String get ozone => 'o3 (Ozone): ';
	String get nitrogenDioxide => 'no2 (Nitrogen dioxide): ';
	String get sulphurDioxide => 'so2 (Sulphur dioxide): ';
	String get pm25 => 'PM2.5: ';
	String get pm10 => 'PM10: ';
	String get quality => 'Quality: ';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'Weathernook';
			case 'exceptions.noInternetConnectionException': return 'No Internet Connection';
			case 'exceptions.unknownApiException': return 'Oops something went wrong';
			case 'error.oops': return 'Ooops, something went wrong!';
			case 'firstLaunchDialog.title': return 'Please read it carefuly';
			case 'firstLaunchDialog.content': return '1. If you experience an API Key error, you can set up your own on the Settings page. There will be a short description of how to do it\n\n2. If you have any questions or want to report a bug, please visit theengineer.dev and send a message from the Contact page\n\n3. You\'ll find a roadmap on my GitHub page, which is linked on theengineer.dev\n\nHave fun!';
			case 'homePage.setLocationMenuItem': return 'Set location';
			case 'homePage.settingsMenuItem': return 'Settings';
			case 'homePage.weatherContent.serverDataUpdatedOn': return 'Server data\nupdated on:';
			case 'homePage.weatherContent.currentTemp': return 'Current temp:';
			case 'homePage.weatherContent.temperature': return ({required Object c, required Object f}) => '${c} ℃, ${f} ℉';
			case 'homePage.weatherContent.feelsLike': return 'Feels like:';
			case 'homePage.weatherContent.sky': return 'Sky:';
			case 'homePage.weatherContent.httpUrlPrefix': return ({required Object url}) => 'https:${url}';
			case 'homePage.weatherContent.windDirection': return 'Wind direction:';
			case 'homePage.weatherContent.windSpeed': return 'Wind speed:';
			case 'homePage.weatherContent.speed': return ({required Object kph, required Object mph}) => '${kph} kph, ${mph} mph';
			case 'homePage.weatherContent.humidity': return 'Humidity: ';
			case 'homePage.weatherContent.percentage': return ({required Object data}) => '${data} %';
			case 'homePage.weatherContent.airQuality': return 'Air quality';
			case 'homePage.weatherContent.mgM3': return ({required Object data}) => '${data} μg/m3';
			case 'homePage.weatherContent.carbonMonoxide': return 'co (Carbon Monoxide): ';
			case 'homePage.weatherContent.ozone': return 'o3 (Ozone): ';
			case 'homePage.weatherContent.nitrogenDioxide': return 'no2 (Nitrogen dioxide): ';
			case 'homePage.weatherContent.sulphurDioxide': return 'so2 (Sulphur dioxide): ';
			case 'homePage.weatherContent.pm25': return 'PM2.5: ';
			case 'homePage.weatherContent.pm10': return 'PM10: ';
			case 'homePage.weatherContent.quality': return 'Quality: ';
			case 'searchPage.title': return 'Choose a location';
			case 'searchPage.nothingWasFound': return 'Nothing was found.';
			case 'searchPage.pleaseEnterOrMoreCharacters': return ({required int amount}) => 'Please enter ${amount} or more characters.';
			case 'settingsPage.title': return 'Settings';
			case 'settingsPage.apiKeyText': return 'If, for any reason, the API does not work, you can use your own API key. Go to https://www.weatherapi.com/, create an account, and get your own key. Then, enter it in the field below and press \'Try it out.\'';
			case 'settingsPage.tryItButton': return 'Try it out!';
			case 'settingsPage.successApiKeyChange': return 'Api Key was successfuly changed!';
			case 'airQualityModel.good': return 'Good';
			case 'airQualityModel.moderate': return 'Moderate';
			case 'airQualityModel.unhealthyForSensitiveGroup': return 'Unhealthy for sensitive group';
			case 'airQualityModel.unhealthy': return 'Unhealthy';
			case 'airQualityModel.veryUnhealthy': return 'Very unhealthy';
			case 'airQualityModel.hazardous': return 'Hazardous';
			case 'airQualityModel.unknown': return 'Unknown';
			case 'appUpdate.titleRequired': return 'Update Required';
			case 'appUpdate.titleSuggested': return 'Update Available';
			case 'appUpdate.textRequired': return 'To continue using app, please go to the store and download the newest version.';
			case 'appUpdate.textSuggested': return 'A new version of the app is ready for you! Update to the latest app to access the newest features and improvements.';
			case 'appUpdate.updateNowButton': return 'Update Now';
			default: return null;
		}
	}
}

