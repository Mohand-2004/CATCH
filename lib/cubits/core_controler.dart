import 'package:catch_world/cubits/mode%20cubit/mode_cubit.dart';
import 'package:catch_world/models/colors.dart';
import 'package:catch_world/services/news%20cubit/news_cubit.dart';
import 'package:catch_world/screens/app_screens.dart';
class CoreControler{
  final List<String> tabs = ['Sports','Business','Arts','Economic','Health','Technology'];
  final List<String> countries = ['Afghanistan', 'Albania', 'Algeria', 'Andorra', 'Angola', 'Argentina', 'Armenia', 'Australia', 'Austria', 'Azerbaijan', 'Bahamas', 'Bahrain', 'Bangladesh', 'Barbados', 'Belarus', 'Belgium', 'Belize', 'Benin', 'Bermuda', 'Bhutan', 'Bolivia', 'Bosnia And Herzegovina', 'Botswana', 'Brazil', 'Brunei', 'Bulgaria', 'Burkina Fasco', 'Burundi', 'Cambodia', 'Cameroon', 'Canada', 'Cape Verde', 'Cayman Islands', 'Central African Republic', 'Chad', 'Chile', 'China', 'Colombia', 'Comoros', 'Congo', 'Cook islands', 'Costa Rica', 'Croatia', 'Cuba', 'Curaçao', 'Cyprus', 'Czech republic', 'Denmark', 'Djibouti', 'Dominica', 'Dominican republic', 'DR Congo', 'Ecuador', 'Egypt', 'El Salvador', 'Equatorial Guinea', 'Eritrea', 'Estonia', 'Eswatini', 'Ethiopia', 'Fiji', 'Finland', 'France', 'French polynesia', 'Gabon', 'Gambia', 'Georgia', 'Germany', 'Ghana', 'Gibraltar', 'Greece', 'Grenada', 'Guatemala', 'Guinea', 'Guyana', 'Haiti', 'Honduras', 'Hong kong', 'Hungary', 'Iceland', 'India', 'Indonesia', 'Iran', 'Iraq', 'Ireland', 'Israel', 'Italy', 'Ivory Coast', 'Jamaica', 'Japan', 'Jersey', 'Jordan', 'Kazakhstan', 'Kenya', 'Kiribati', 'Kosovo', 'Kuwait', 'Kyrgyzstan', 'Laos', 'Latvia', 'Lebanon', 'Lesotho', 'Liberia', 'Libya', 'Liechtenstein', 'Lithuania', 'Luxembourg', 'Macau', 'Macedonia', 'Madagascar', 'Malawi', 'Malaysia', 'Maldives', 'Mali', 'Malta', 'Marshall Islands', 'Mauritania', 'Mauritius', 'Mexico', 'Micronesia', 'Moldova', 'Monaco', 'Mongolia', 'Montenegro', 'Morocco', 'Mozambique', 'Myanmar', 'Namibia', 'Nauru', 'Nepal', 'Netherland', 'New caledonia', 'New zealand', 'Nicaragua', 'Niger', 'Nigeria', 'North korea', 'Norway', 'Oman', 'Pakistan', 'Palau', 'Palestine', 'Panama', 'Papua New Guinea', 'Paraguay', 'Peru', 'Philippines', 'Poland', 'Portugal', 'Puerto rico', 'Qatar', 'Romania', 'Russia', 'Rwanda', 'Saint lucia', 'Saint martin(dutch)', 'Samoa', 'San Marino', 'Sao tome and principe', 'Saudi arabia', 'Senegal', 'Serbia', 'Seychelles', 'Sierra Leone', 'Singapore', 'Slovakia', 'Slovenia', 'Solomon Islands', 'Somalia', 'South africa', 'South korea', 'Spain', 'Sri Lanka', 'Sudan', 'Suriname', 'Sweden', 'Switzerland', 'Syria', 'Taiwan', 'Tajikistan', 'Tanzania', 'Thailand', 'Timor-Leste', 'Togo', 'Tonga', 'Trinidad and tobago', 'Tunisia', 'Turkey', 'Turkmenistan', 'Tuvalu', 'Uganda', 'Ukraine', 'United arab emirates', 'United kingdom', 'United states of america', 'Uruguay', 'Uzbekistan', 'Vanuatu', 'Vatican', 'Venezuela', 'Vietnam', 'Virgin Islands (British)', 'World', 'Yemen', 'Zambia', 'Zimbabwe'];
  final List<String> languages = ['Afrikaans', 'Albanian', 'Amharic', 'Arabic', 'Armenian', 'Assamese', 'Azerbaijani', 'Bambara', 'Basque', 'Belarusian', 'Bengali', 'Bosnian', 'Bulgarian', 'Burmese', 'Catalan', 'Central Kurdish', 'Chinese', 'Croatian', 'Czech', 'Danish', 'Dutch', 'English', 'Estonian', 'Filipino', 'Finnish', 'French', 'Galician', 'Georgian', 'German', 'Greek', 'Gujarati', 'Hausa', 'Hebrew', 'Hindi', 'Hungarian', 'Icelandic', 'Indonesian', 'Italian', 'Japanese', 'Kannada', 'Kazakh', 'Khmer', 'Kinyarwanda', 'Korean', 'Kurdish', 'Latvian', 'Lithuanian', 'Luxembourgish', 'Macedonian', 'Malay', 'Malayalam', 'Maltese', 'Maori', 'Marathi', 'Mongolian', 'Nepali', 'Norwegian', 'Oriya', 'Pashto', 'Persian', 'Polish', 'Portuguese', 'Punjabi', 'Romanian', 'Russian', 'Samoan', 'Serbian', 'Shona', 'Sindhi', 'Sinhala', 'Slovak', 'Slovenian', 'Somali', 'Spanish', 'Swahili', 'Swedish', 'Tajik', 'Tamil', 'Telugu', 'Thai', 'Traditional Chinese', 'Turkish', 'Turkmen', 'Ukrainian', 'Urdu', 'Uzbek', 'Vietnamese', 'Welsh', 'Zulu'];
  final AppScreens appScreens = AppScreens();
  final NewsServiceCubit homeNewsCubit = NewsServiceCubit();
  final NewsServiceCubit searchNewsCubit = NewsServiceCubit();
  final NewsServiceCubit trendingNewsCubit = NewsServiceCubit();
  final ModeCubit modeCubit = ModeCubit();
  ColorCollection currentTheme = AppThemes.hellTheme;
  String? country;
  String? category;
  String? language;
  int currentScreenIndex = 1;
  CoreControler(){
    homeNewsCubit.getgeneralnews();
    trendingNewsCubit.gettrendingnews();
    searchNewsCubit.searchnews('a');
  }
  void resetFilters(){
    country = null;
    category = null;
    language = null;
  }
  String? getCountryCode(String? countryName){
    switch (countryName?.toLowerCase()){
      case 'afghanistan':
        return 'af';
      case 'albania':
        return 'al';
      case 'algeria':
        return 'dz';
      case 'andorra':
        return 'ad';
      case 'angola':
        return 'ao';
      case 'argentina':
        return 'ar';
      case 'armenia':
        return 'am';
      case 'australia':
        return 'au';
      case 'austria':
        return 'at';
      case 'azerbaijan':
        return 'az';
      case 'bahamas':
        return 'bs';
      case 'bahrain':
        return 'bh';
      case 'bangladesh':
        return 'bd';
      case 'barbados':
        return 'bb';
      case 'belarus':
        return 'by';
      case 'belgium':
        return 'be';
      case 'belize':
        return 'bz';
      case 'benin':
        return 'bj';
      case 'bermuda':
        return 'bm';
      case 'bhutan':
        return 'bt';
      case 'bolivia':
        return 'bo';
      case 'bosnia and herzegovina':
        return 'ba';
      case 'botswana':
        return 'bw';
      case 'brazil':
        return 'br';
      case 'brunei':
        return 'bn';
      case 'bulgaria':
        return 'bg';
      case 'burkina fasco':
        return 'bf';
      case 'burundi':
        return 'bi';
      case 'cambodia':
        return 'kh';
      case 'cameroon':
        return 'cm';
      case 'canada':
        return 'ca';
      case 'cape verde':
        return 'cv';
      case 'cayman islands':
        return 'ky';
      case 'central african republic':
        return 'cf';
      case 'chad':
        return 'td';
      case 'chile':
        return 'cl';
      case 'china':
        return 'cn';
      case 'colombia':
        return 'co';
      case 'comoros':
        return 'km';
      case 'congo':
        return 'cg';
      case 'cook islands':
        return 'ck';
      case 'costa rica':
        return 'cr';
      case 'croatia':
        return 'hr';
      case 'cuba':
        return 'cu';
      case 'curaçao':
        return 'cw';
      case 'cyprus':
        return 'cy';
      case 'czech republic':
        return 'cz';
      case 'denmark':
        return 'dk';
      case 'djibouti':
        return 'dj';
      case 'dominica':
        return 'dm';
      case 'dominican republic':
        return 'do';
      case 'dr congo':
        return 'cd';
      case 'ecuador':
        return 'ec';
      case 'egypt':
        return 'eg';
      case 'el salvador':
        return 'sv';
      case 'equatorial guinea':
        return 'gq';
      case 'eritrea':
        return 'er';
      case 'estonia':
        return 'ee';
      case 'eswatini':
        return 'sz';
      case 'ethiopia':
        return 'et';
      case 'fiji':
        return 'fj';
      case 'finland':
        return 'fi';
      case 'france':
        return 'fr';
      case 'french polynesia':
        return 'pf';
      case 'gabon':
        return 'ga';
      case 'gambia':
        return 'gm';
      case 'georgia':
        return 'ge';
      case 'germany':
        return 'de';
      case 'ghana':
        return 'gh';
      case 'gibraltar':
        return 'gi';
      case 'greece':
        return 'gr';
      case 'grenada':
        return 'gd';
      case 'guatemala':
        return 'gt';
      case 'guinea':
        return 'gn';
      case 'guyana':
        return 'gy';
      case 'haiti':
        return 'ht';
      case 'honduras':
        return 'hn';
      case 'hong kong':
        return 'hk';
      case 'hungary':
        return 'hu';
      case 'iceland':
        return 'is';
      case 'india':
        return 'in';
      case 'indonesia':
        return 'id';
      case 'iran':
        return 'ir';
      case 'iraq':
        return 'iq';
      case 'ireland':
        return 'ie';
      case 'israel':
        return 'il';
      case 'italy':
        return 'it';
      case 'ivory coast':
        return 'ci';
      case 'jamaica':
        return 'jm';
      case 'japan':
        return 'jp';
      case 'jersey':
        return 'je';
      case 'jordan':
        return 'jo';
      case 'kazakhstan':
        return 'kz';
      case 'kenya':
        return 'ke';
      case 'kiribati':
        return 'ki';
      case 'kosovo':
        return 'xk';
      case 'kuwait':
        return 'kw';
      case 'kyrgyzstan':
        return 'kg';
      case 'laos':
        return 'la';
      case 'latvia':
        return 'lv';
      case 'lebanon':
        return 'lb';
      case 'lesotho':
        return 'ls';
      case 'liberia':
        return 'lr';
      case 'libya':
        return 'ly';
      case 'liechtenstein':
        return 'li';
      case 'lithuania':
        return 'lt';
      case 'luxembourg':
        return 'lu';
      case 'macau':
        return 'mo';
      case 'macedonia':
        return 'mk';
      case 'madagascar':
        return 'mg';
      case 'malawi':
        return 'mw';
      case 'malaysia':
        return 'my';
      case 'maldives':
        return 'mv';
      case 'mali':
        return 'ml';
      case 'malta':
        return 'mt';
      case 'marshall islands':
        return 'mh';
      case 'mauritania':
        return 'mr';
      case 'mauritius':
        return 'mu';
      case 'mexico':
        return 'mx';
      case 'micronesia':
        return 'fm';
      case 'moldova':
        return 'md';
      case 'monaco':
        return 'mc';
      case 'mongolia':
        return 'mn';
      case 'montenegro':
        return 'me';
      case 'morocco':
        return 'ma';
      case 'mozambique':
        return 'mz';
      case 'myanmar':
        return 'mm';
      case 'namibia':
        return 'na';
      case 'nauru':
        return 'nr';
      case 'nepal':
        return 'np';
      case 'netherland':
        return 'nl';
      case 'new caledonia':
        return 'nc';
      case 'new zealand':
        return 'nz';
      case 'nicaragua':
        return 'ni';
      case 'niger':
        return 'ne';
      case "nigeria":
        return "ng";
      case "north korea":
        return "kp";
      case "norway":
        return "no";
      case "oman":
        return "om";
      case "pakistan":
        return "pk";
      case "palau":
        return "pw";
      case "palestine":
        return "ps";
      case "panama":
        return "pa";
      case "papua new guinea":
        return "pg";
      case "paraguay":
        return "py";
      case "peru":
        return "pe";
      case "philippines":
        return "ph";
      case "poland":
        return "pl";
      case "portugal":
        return "pt";
      case "puerto rico":
        return "pr";
      case "qatar":
        return "qa";
      case "romania":
        return "ro";
      case "russia":
        return "ru";
      case "rwanda":
        return "rw";
      case "saint lucia":
        return "lc";
      case "saint martin (dutch)":
        return "sx";
      case "samoa":
        return "ws";
      case "san marino":
        return "sm";
      case "sao tome and principe":
        return "st";
      case "saudi arabia":
        return "sa";
      case "senegal":
        return "sn";
      case "serbia":
        return "rs";
      case "seychelles":
        return "sc";
      case "sierra leone":
        return "sl";
      case "singapore":
        return "sg";
      case "slovakia":
        return "sk";
      case "slovenia":
        return "si";
      case "solomon islands":
        return "sb";
      case "somalia":
        return "so";
      case "south africa":
        return "za";
      case "south korea":
        return "kr";
      case "spain":
        return "es";
      case "sri lanka":
        return "lk";
      case "sudan":
        return "sd";
      case "suriname":
        return "sr";
      case "sweden":
        return "se";
      case "switzerland":
        return "ch";
      case "syria":
        return "sy";
      case "taiwan":
        return "tw";
      case "tajikistan":
        return "tj";
      case "tanzania":
        return "tz";
      case "thailand":
        return "th";
      case "timor-leste":
        return "tl";
      case "togo":
        return "tg";
      case "tonga":
        return "to";
      case "trinidad and tobago":
        return "tt";
      case "tunisia":
        return "tn";
      case "turkey":
        return "tr";
      case "turkmenistan":
        return "tm";
      case "tuvalu":
        return "tv";
      case "uganda":
        return "ug";
      case "ukraine":
        return "ua";
      case "united arab emirates":
        return "ae";
      case "united kingdom":
        return "gb";
      case "united states of america":
        return "us";
      case "uruguay":
        return "uy";
      case "uzbekistan":
        return "uz";
      case "vanuatu":
        return "vu";
      case "vatican":
        return "va";
      case "venezuela":
        return "ve";
      case "vietnam":
        return "vi";
      case "virgin islands (british)":
        return "vg";
      case "world":
        return "wo";
      case "yemen":
        return "ye";
      case "zambia":
        return "zm";
      case "zimbabwe":
        return "zw";
      default:
        return null;
      }
    }

  String? getLanguageCode(String? languageName) {
    switch (languageName?.toLowerCase()) {
      case 'afrikaans':
        return 'af';
      case 'albanian':
        return 'sq';
      case 'amharic':
        return 'am';
      case 'arabic':
        return 'ar';
      case 'armenian':
        return 'hy';
      case 'assamese':
        return 'as';
      case 'azerbaijani':
        return 'az';
      case 'bambara':
        return 'bm';
      case 'basque':
        return 'eu';
      case 'belarusian':
        return 'be';
      case 'bengali':
        return 'bn';
      case 'bosnian':
        return 'bs';
      case 'bulgarian':
        return 'bg';
      case 'burmese':
        return 'my';
      case 'catalan':
        return 'ca';
      case 'central kurdish':
        return 'ckb';
      case 'chinese':
        return 'zh';
      case 'croatian':
        return 'hr';
      case 'czech':
        return 'cs';
      case 'danish':
        return 'da';
      case 'dutch':
        return 'nl';
      case 'english':
        return 'en';
      case 'estonian':
        return 'et';
      case 'filipino':
        return 'pi';
      case 'finnish':
        return 'fi';
      case 'french':
        return 'fr';
      case 'galician':
        return 'gl';
      case 'georgian':
        return 'ka';
      case 'german':
        return 'de';
      case 'greek':
        return 'el';
      case 'gujarati':
        return 'gu';
      case 'hausa':
        return 'ha';
      case 'hebrew':
        return 'he';
      case 'hindi':
        return 'hi';
      case 'hungarian':
        return 'hu';
      case 'icelandic':
        return 'is';
      case 'indonesian':
        return 'id';
      case 'italian':
        return 'it';
      case 'japanese':
        return 'jp';
      case 'kannada':
        return 'kn';
      case 'kazakh':
        return 'kz';
      case 'khmer':
        return 'kh';
      case 'kinyarwanda':
        return 'rw';
      case 'korean':
        return 'ko';
      case 'kurdish':
        return 'ku';
      case 'latvian':
        return 'lv';
      case 'lithuanian':
        return 'lt';
      case 'luxembourgish':
        return 'lb';
      case 'macedonian':
        return 'mk';
      case 'malay':
        return 'ms';
      case 'malayalam':
        return 'ml';
      case 'maltese':
        return 'mt';
      case 'maori':
        return 'mi';
      case 'marathi':
        return 'mr';
      case 'mongolian':
        return 'mn';
      case 'nepali':
        return 'ne';
      case 'norwegian':
        return 'no';
      case 'oriya':
        return 'or';
      case 'pashto':
        return 'ps';
      case 'persian':
        return 'fa';
      case 'polish':
        return 'pl';
      case 'portuguese':
        return 'pt';
      case 'punjabi':
        return 'pa';
      case 'romanian':
        return 'ro';
      case 'russian':
        return 'ru';
      case 'samoan':
        return 'sm';
      case 'serbian':
        return 'sr';
      case 'shona':
        return 'sn';
      case 'sindhi':
        return 'sd';
      case 'sinhala':
        return 'si';
      case 'slovak':
        return 'sk';
      case 'slovenian':
        return 'sl';
      case 'somali':
        return 'so';
      case 'spanish':
        return 'es';
      case 'swahili':
        return 'sw';
      case 'swedish':
        return 'sv';
      case 'tajik':
        return 'tg';
      case 'tamil':
        return 'ta';
      case 'telugu':
        return 'te';
      case 'thai':
        return 'th';
      case 'traditional chinese':
        return 'zht';
      case 'turkish':
        return 'tr';
      case 'turkmen':
        return 'tk';
      case 'ukrainian':
        return 'uk';
      case 'urdu':
        return 'ur';
      case 'uzbek':
        return 'uz';
      case 'vietnamese':
        return 'vi';
      case 'welsh':
        return 'cy';
      case 'zulu':
        return 'zu';
      default:
        return null;
    }
  }
}
CoreControler coreControler = CoreControler();