//^ COMMON CONSTANTS
const String appTitle = 'DUNI Market';
const String forgetPasswordTitle =
    '''Don't worry! it occurs,Please enter the email \naddress linked with your account''';
const otpSubtitle = 'Please enter the 4 digit code sent to example@gmail.com';

//^SHARED KEYS
const String introStatusKey = 'intro';
const String authStatusKey = 'auth';
const String saveThemeKey = 'theme_mode';

//^ REGEX PATTERNS
const emailPattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
const passwordPattern =
    r'^(?=.*?[A-Za-z])(?=.*?\d)[A-Za-z\d]{8,}$'; // At least 8 chars, one letter, one digit
const otpPattern = r'^\d{6}$'; // Assuming OTP is 6 digits long

//^ RESPONSIVENESS
const int mobileSize = 550;
const int tabletSize = 1100;

//^ API URLs
const String baseURL = 'http://programmingshow.ir/api/api';
