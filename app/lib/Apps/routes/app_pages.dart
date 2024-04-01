import '../../Dontaion/donation.dart';
import '../../LocationAndVolunterrs/SylhetRegion.dart';
import '../../Services/email_verify/forgate_password/forgatePassword.dart';
import '../../login_reg/registration.dart';
import '../../pages/splash.dart';
import '../../weather-parts/main-page/district-profile.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final routes = {
    '/splashS': (context) => splashS(),
    AppRoutes.REGISTRATION: (context) => regscreen(),
    AppRoutes.FORGETPASS: (context) => ForgotPassword(),
    AppRoutes.DISTRICTGRIDEPAGE: (context) => DistrictGridPage(),
    AppRoutes.GETAREASFIREBASE: (context) => GetAreasFirsbase(),
    AppRoutes.DONATIONPAGE: (context) => DonationPage(),

    // AppRoutes.HOME: (context) => HomePage(),
  };
}
