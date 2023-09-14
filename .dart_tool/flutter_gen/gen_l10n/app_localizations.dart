import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
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
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @selected_language.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get selected_language;

  /// No description provided for @selected_language_code.
  ///
  /// In en, this message translates to:
  /// **'en'**
  String get selected_language_code;

  /// The current Language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// The live_longer btn
  ///
  /// In en, this message translates to:
  /// **'Live longer \nwith healthy food '**
  String get live_longer;

  /// The lorem txt
  ///
  /// In en, this message translates to:
  /// **'Lorem Ipsum is simply dummy text of the printing and typesetting'**
  String get lorem;

  /// The choose_language txt
  ///
  /// In en, this message translates to:
  /// **'Choose your Language '**
  String get choose_language;

  /// The don't_have_account btn
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get dont_have_account;

  /// The Take a tour btn
  ///
  /// In en, this message translates to:
  /// **'Take a tour'**
  String get take_a_tour;

  /// The login btn
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// The login_with btn
  ///
  /// In en, this message translates to:
  /// **'Login with'**
  String get login_with;

  /// The or btn
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// The Google btn
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get google;

  /// The Twitter btn
  ///
  /// In en, this message translates to:
  /// **'Twitter'**
  String get twitter;

  /// The facebook btn
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebook;

  /// The apple btn
  ///
  /// In en, this message translates to:
  /// **'Apple Id'**
  String get apple;

  /// The login_email btn
  ///
  /// In en, this message translates to:
  /// **'Login with email'**
  String get login_email;

  /// The welcome_back txt
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcome_back;

  /// The first_name txt
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get first_name;

  /// The last_name txt
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get last_name;

  /// The password txt
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// The i_forget_my_password btn
  ///
  /// In en, this message translates to:
  /// **'I forget my password'**
  String get i_forget_my_password;

  /// The lets_start txt
  ///
  /// In en, this message translates to:
  /// **'Let’s Start Your\nHealty Life'**
  String get lets_start;

  /// The email txt
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone;

  /// The Verify txt
  ///
  /// In en, this message translates to:
  /// **'Verify Password'**
  String get re_password;

  /// The sign_up txt
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get sign_up;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account ?'**
  String get already_have_account;

  /// home txt
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// work txt
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get work;

  /// No description provided for @add_other_location.
  ///
  /// In en, this message translates to:
  /// **'New Location'**
  String get add_other_location;

  /// No description provided for @address_name.
  ///
  /// In en, this message translates to:
  /// **'Address name'**
  String get address_name;

  /// No description provided for @address_details.
  ///
  /// In en, this message translates to:
  /// **'Address details'**
  String get address_details;

  /// No description provided for @building.
  ///
  /// In en, this message translates to:
  /// **'building'**
  String get building;

  /// No description provided for @floor.
  ///
  /// In en, this message translates to:
  /// **'floor'**
  String get floor;

  /// No description provided for @door.
  ///
  /// In en, this message translates to:
  /// **'door'**
  String get door;

  /// No description provided for @more_details.
  ///
  /// In en, this message translates to:
  /// **'More Details'**
  String get more_details;

  /// No description provided for @select_your_location.
  ///
  /// In en, this message translates to:
  /// **'Select your location'**
  String get select_your_location;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @deliver_to.
  ///
  /// In en, this message translates to:
  /// **'  Deliver to :  '**
  String get deliver_to;

  /// No description provided for @choose_your_food_category.
  ///
  /// In en, this message translates to:
  /// **'Choose your Food Category'**
  String get choose_your_food_category;

  /// No description provided for @packages.
  ///
  /// In en, this message translates to:
  /// **'Packages'**
  String get packages;

  /// No description provided for @change_delivery_time.
  ///
  /// In en, this message translates to:
  /// **'Change Delivery Time '**
  String get change_delivery_time;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'start'**
  String get start;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Check Out'**
  String get checkout;

  /// No description provided for @place_order.
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get place_order;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @plan.
  ///
  /// In en, this message translates to:
  /// **'Plan'**
  String get plan;

  /// No description provided for @active_plan.
  ///
  /// In en, this message translates to:
  /// **'Active Plan'**
  String get active_plan;

  /// No description provided for @previous_plan.
  ///
  /// In en, this message translates to:
  /// **'Previous Plan'**
  String get previous_plan;

  /// No description provided for @main.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get main;

  /// No description provided for @my_plan.
  ///
  /// In en, this message translates to:
  /// **'My Plan'**
  String get my_plan;

  /// No description provided for @offers.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get offers;

  /// No description provided for @no_offers.
  ///
  /// In en, this message translates to:
  /// **'No Offers'**
  String get no_offers;

  /// No description provided for @code_copied.
  ///
  /// In en, this message translates to:
  /// **'Code Copied'**
  String get code_copied;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notification;

  /// No description provided for @you_dont_have_notification.
  ///
  /// In en, this message translates to:
  /// **'you don\'t have Notification'**
  String get you_dont_have_notification;

  /// No description provided for @gifts.
  ///
  /// In en, this message translates to:
  /// **'Gifts'**
  String get gifts;

  /// No description provided for @you_dont_have_gifts.
  ///
  /// In en, this message translates to:
  /// **'you don\'t have gifts'**
  String get you_dont_have_gifts;

  /// No description provided for @t_c.
  ///
  /// In en, this message translates to:
  /// **'Terms & conditions'**
  String get t_c;

  /// No description provided for @feedback.
  ///
  /// In en, this message translates to:
  /// **'feedback'**
  String get feedback;

  /// No description provided for @send_feedback.
  ///
  /// In en, this message translates to:
  /// **'Send us your feedback!'**
  String get send_feedback;

  /// No description provided for @feedback_suggestion.
  ///
  /// In en, this message translates to:
  /// **'Do you have a suggestion or some issue \n let us know in the field below '**
  String get feedback_suggestion;

  /// No description provided for @how_was_experience.
  ///
  /// In en, this message translates to:
  /// **'How was your experience'**
  String get how_was_experience;

  /// No description provided for @tell_a_friend.
  ///
  /// In en, this message translates to:
  /// **'Tell a friend'**
  String get tell_a_friend;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;

  /// No description provided for @egyptian_currency.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get egyptian_currency;

  /// No description provided for @saudi_currency.
  ///
  /// In en, this message translates to:
  /// **'SAR'**
  String get saudi_currency;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get days;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @selected.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get selected;

  /// No description provided for @protein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get protein;

  /// No description provided for @carb.
  ///
  /// In en, this message translates to:
  /// **'Carb'**
  String get carb;

  /// No description provided for @calories.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get calories;

  /// No description provided for @fats.
  ///
  /// In en, this message translates to:
  /// **'Fats'**
  String get fats;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @coupon_usage.
  ///
  /// In en, this message translates to:
  /// **'You have applied '**
  String get coupon_usage;

  /// No description provided for @off.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get off;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @enter.
  ///
  /// In en, this message translates to:
  /// **'Enter '**
  String get enter;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add '**
  String get add;

  /// No description provided for @checking.
  ///
  /// In en, this message translates to:
  /// **'Checking '**
  String get checking;

  /// No description provided for @promo_code.
  ///
  /// In en, this message translates to:
  /// **'Promo Code'**
  String get promo_code;

  /// No description provided for @invalid_code.
  ///
  /// In en, this message translates to:
  /// **'the code is invalid !'**
  String get invalid_code;

  /// No description provided for @choose_country.
  ///
  /// In en, this message translates to:
  /// **'Choose your Country '**
  String get choose_country;

  /// No description provided for @choose_area.
  ///
  /// In en, this message translates to:
  /// **'Choose your Area '**
  String get choose_area;

  /// No description provided for @select_city.
  ///
  /// In en, this message translates to:
  /// **'Select City'**
  String get select_city;

  /// No description provided for @select_area.
  ///
  /// In en, this message translates to:
  /// **'Select Area'**
  String get select_area;

  /// No description provided for @egypt.
  ///
  /// In en, this message translates to:
  /// **'Egypt'**
  String get egypt;

  /// No description provided for @saudi_arabia.
  ///
  /// In en, this message translates to:
  /// **'Saudi Arabia'**
  String get saudi_arabia;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get setting;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @save_changes.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save_changes;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @editing_profile.
  ///
  /// In en, this message translates to:
  /// **'Editing Profile ...'**
  String get editing_profile;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @delivery_details.
  ///
  /// In en, this message translates to:
  /// **'Delivery details'**
  String get delivery_details;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @need_help.
  ///
  /// In en, this message translates to:
  /// **'Need Help ?'**
  String get need_help;

  /// No description provided for @help_center.
  ///
  /// In en, this message translates to:
  /// **'Brunchen Help Center'**
  String get help_center;

  /// No description provided for @help_center_text.
  ///
  /// In en, this message translates to:
  /// **'how can we help you ?'**
  String get help_center_text;

  /// No description provided for @cancel_meal.
  ///
  /// In en, this message translates to:
  /// **'Cancel this Meal'**
  String get cancel_meal;

  /// No description provided for @edit_meal.
  ///
  /// In en, this message translates to:
  /// **'Edit Meal'**
  String get edit_meal;

  /// No description provided for @change_meal.
  ///
  /// In en, this message translates to:
  /// **'Change Meal'**
  String get change_meal;

  /// No description provided for @change_time.
  ///
  /// In en, this message translates to:
  /// **'Change Time'**
  String get change_time;

  /// No description provided for @change_location.
  ///
  /// In en, this message translates to:
  /// **'Change Location'**
  String get change_location;

  /// No description provided for @change_day.
  ///
  /// In en, this message translates to:
  /// **'Change Day'**
  String get change_day;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorite;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @appoiment.
  ///
  /// In en, this message translates to:
  /// **'Appointments'**
  String get appoiment;

  /// No description provided for @hospitals.
  ///
  /// In en, this message translates to:
  /// **'Hospitals'**
  String get hospitals;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @medical_products.
  ///
  /// In en, this message translates to:
  /// **'Medical products'**
  String get medical_products;

  /// No description provided for @medical_centers.
  ///
  /// In en, this message translates to:
  /// **'Medical centers'**
  String get medical_centers;

  /// No description provided for @doctors.
  ///
  /// In en, this message translates to:
  /// **'Doctors'**
  String get doctors;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @morning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get morning;

  /// No description provided for @hi.
  ///
  /// In en, this message translates to:
  /// **'Hi'**
  String get hi;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @select_new_meal.
  ///
  /// In en, this message translates to:
  /// **'select new meal'**
  String get select_new_meal;

  /// No description provided for @select_new_time.
  ///
  /// In en, this message translates to:
  /// **'select new time'**
  String get select_new_time;

  /// No description provided for @select_new_location.
  ///
  /// In en, this message translates to:
  /// **'select new location'**
  String get select_new_location;

  /// No description provided for @edit_meal_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm Meal Edit'**
  String get edit_meal_confirm;

  /// No description provided for @edit_meal_confirm_text.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to edit ?'**
  String get edit_meal_confirm_text;

  /// No description provided for @cancel_meal_text.
  ///
  /// In en, this message translates to:
  /// **'if you want to cancel this day meal you will need to reschedule this meal to another day'**
  String get cancel_meal_text;

  /// No description provided for @no_cancel_edit.
  ///
  /// In en, this message translates to:
  /// **'you can\'t cancel or edit the meal after 6 am please contact us for more info.'**
  String get no_cancel_edit;

  /// No description provided for @search_here.
  ///
  /// In en, this message translates to:
  /// **'search here ...'**
  String get search_here;

  /// No description provided for @clinics.
  ///
  /// In en, this message translates to:
  /// **'Clinics'**
  String get clinics;

  /// No description provided for @mediciens.
  ///
  /// In en, this message translates to:
  /// **'Mediciens'**
  String get mediciens;

  /// No description provided for @mediciens_delivery.
  ///
  /// In en, this message translates to:
  /// **'Medicien Delivery'**
  String get mediciens_delivery;

  /// No description provided for @healthy_food.
  ///
  /// In en, this message translates to:
  /// **'Healthy Food'**
  String get healthy_food;

  /// No description provided for @labs.
  ///
  /// In en, this message translates to:
  /// **'Labs'**
  String get labs;

  /// No description provided for @med_repo.
  ///
  /// In en, this message translates to:
  /// **'medical reports external and domestic'**
  String get med_repo;

  /// No description provided for @consulting.
  ///
  /// In en, this message translates to:
  /// **'Consulting over the phone'**
  String get consulting;

  /// No description provided for @local.
  ///
  /// In en, this message translates to:
  /// **'local'**
  String get local;

  /// No description provided for @external.
  ///
  /// In en, this message translates to:
  /// **'External'**
  String get external;

  /// No description provided for @medical_report.
  ///
  /// In en, this message translates to:
  /// **'Medical Report'**
  String get medical_report;

  /// No description provided for @medical_reports.
  ///
  /// In en, this message translates to:
  /// **'Medical Reports'**
  String get medical_reports;

  /// No description provided for @doctors_name.
  ///
  /// In en, this message translates to:
  /// **'Doctor\'s name'**
  String get doctors_name;

  /// No description provided for @patient_name.
  ///
  /// In en, this message translates to:
  /// **'Patient name'**
  String get patient_name;

  /// No description provided for @report_summary.
  ///
  /// In en, this message translates to:
  /// **'Report summary'**
  String get report_summary;

  /// No description provided for @ratings.
  ///
  /// In en, this message translates to:
  /// **'Ratings'**
  String get ratings;

  /// No description provided for @the_number_of_hospital_visitors.
  ///
  /// In en, this message translates to:
  /// **'hospital visitors'**
  String get the_number_of_hospital_visitors;

  /// No description provided for @existing_doctors.
  ///
  /// In en, this message translates to:
  /// **'Existing doctors'**
  String get existing_doctors;

  /// No description provided for @hospital_services.
  ///
  /// In en, this message translates to:
  /// **'Hospital services'**
  String get hospital_services;

  /// No description provided for @appointment_booking.
  ///
  /// In en, this message translates to:
  /// **'Book Appointment'**
  String get appointment_booking;

  /// No description provided for @book_a_hospital_appointment.
  ///
  /// In en, this message translates to:
  /// **'Book a hospital appointment'**
  String get book_a_hospital_appointment;

  /// No description provided for @choose_doctor.
  ///
  /// In en, this message translates to:
  /// **'Choose Doctor'**
  String get choose_doctor;

  /// No description provided for @choose_service.
  ///
  /// In en, this message translates to:
  /// **'Choose Service'**
  String get choose_service;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @cost.
  ///
  /// In en, this message translates to:
  /// **'Cost'**
  String get cost;

  /// No description provided for @thank_you.
  ///
  /// In en, this message translates to:
  /// **'Thank you'**
  String get thank_you;

  /// No description provided for @your_appointment_has_been_successfully_booked_please.
  ///
  /// In en, this message translates to:
  /// **'Your appointment has been successfully booked. Please pay to get an appointment with the chosen doctor'**
  String get your_appointment_has_been_successfully_booked_please;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'date'**
  String get date;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'address'**
  String get address;

  /// No description provided for @pay_in_the.
  ///
  /// In en, this message translates to:
  /// **'pay in the'**
  String get pay_in_the;

  /// No description provided for @about_doctor.
  ///
  /// In en, this message translates to:
  /// **'About The Doctor'**
  String get about_doctor;

  /// No description provided for @clinic_details.
  ///
  /// In en, this message translates to:
  /// **'clinic details'**
  String get clinic_details;

  /// No description provided for @other_clinics.
  ///
  /// In en, this message translates to:
  /// **'other clinics'**
  String get other_clinics;

  /// No description provided for @coming.
  ///
  /// In en, this message translates to:
  /// **'Coming'**
  String get coming;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @canceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get canceled;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'search'**
  String get search;

  /// No description provided for @search_txt.
  ///
  /// In en, this message translates to:
  /// **'search for elements'**
  String get search_txt;

  /// No description provided for @book1team.
  ///
  /// In en, this message translates to:
  /// **'Book a team'**
  String get book1team;

  /// No description provided for @book2teams.
  ///
  /// In en, this message translates to:
  /// **'Book 2 teams'**
  String get book2teams;

  /// No description provided for @facilities_and_services.
  ///
  /// In en, this message translates to:
  /// **'facilities and services'**
  String get facilities_and_services;

  /// No description provided for @extra_info.
  ///
  /// In en, this message translates to:
  /// **'extra Info'**
  String get extra_info;

  /// No description provided for @suggestions.
  ///
  /// In en, this message translates to:
  /// **'suggestions'**
  String get suggestions;

  /// No description provided for @matches.
  ///
  /// In en, this message translates to:
  /// **'matches'**
  String get matches;

  /// No description provided for @matches_txt.
  ///
  /// In en, this message translates to:
  /// **'all avilable matches'**
  String get matches_txt;

  /// No description provided for @teams.
  ///
  /// In en, this message translates to:
  /// **'The teams'**
  String get teams;

  /// No description provided for @playoffs.
  ///
  /// In en, this message translates to:
  /// **'The playoffs'**
  String get playoffs;

  /// No description provided for @current_password.
  ///
  /// In en, this message translates to:
  /// **'current password'**
  String get current_password;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'new password'**
  String get new_password;

  /// No description provided for @current_email.
  ///
  /// In en, this message translates to:
  /// **'current email'**
  String get current_email;

  /// No description provided for @new_email.
  ///
  /// In en, this message translates to:
  /// **'new email'**
  String get new_email;

  /// No description provided for @current_phone.
  ///
  /// In en, this message translates to:
  /// **'current phone'**
  String get current_phone;

  /// No description provided for @new_phone.
  ///
  /// In en, this message translates to:
  /// **'new phone'**
  String get new_phone;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @have_account.
  ///
  /// In en, this message translates to:
  /// **'Do you have an Account'**
  String get have_account;

  /// No description provided for @create_new_account.
  ///
  /// In en, this message translates to:
  /// **'create new account'**
  String get create_new_account;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get create_account;

  /// No description provided for @login_to_follow.
  ///
  /// In en, this message translates to:
  /// **'Login to see what\'s new'**
  String get login_to_follow;

  /// No description provided for @remember_me.
  ///
  /// In en, this message translates to:
  /// **'remember me'**
  String get remember_me;

  /// No description provided for @register_to_follow.
  ///
  /// In en, this message translates to:
  /// **'Register to see what\'s new'**
  String get register_to_follow;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'description'**
  String get description;

  /// No description provided for @ingredients.
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get ingredients;

  /// No description provided for @similar_drugs.
  ///
  /// In en, this message translates to:
  /// **'Similar Drugs'**
  String get similar_drugs;

  /// No description provided for @add_to_cart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get add_to_cart;

  /// No description provided for @drug_delivery.
  ///
  /// In en, this message translates to:
  /// **'Drug Deliver'**
  String get drug_delivery;

  /// No description provided for @food_contains_protien.
  ///
  /// In en, this message translates to:
  /// **'Food contains protien'**
  String get food_contains_protien;

  /// No description provided for @food_contains_sugar.
  ///
  /// In en, this message translates to:
  /// **'Food contains sugar'**
  String get food_contains_sugar;

  /// No description provided for @benifits.
  ///
  /// In en, this message translates to:
  /// **'benifits'**
  String get benifits;

  /// No description provided for @food_pictures.
  ///
  /// In en, this message translates to:
  /// **'Food pictures'**
  String get food_pictures;

  /// No description provided for @indications.
  ///
  /// In en, this message translates to:
  /// **'Indications'**
  String get indications;

  /// No description provided for @cancel_request.
  ///
  /// In en, this message translates to:
  /// **'Cancel Request'**
  String get cancel_request;

  /// No description provided for @cancel_request_text.
  ///
  /// In en, this message translates to:
  /// **'your request has been submitted to the admin to review. we will let you know when the admin response'**
  String get cancel_request_text;

  /// No description provided for @cancel_plan.
  ///
  /// In en, this message translates to:
  /// **'Cancel The plan'**
  String get cancel_plan;

  /// No description provided for @cancel_plan_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm Canceling The plan'**
  String get cancel_plan_confirm;

  /// No description provided for @cancel_plan_confirm_text.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel this plan ?'**
  String get cancel_plan_confirm_text;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @view_all.
  ///
  /// In en, this message translates to:
  /// **'view all'**
  String get view_all;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @help_text.
  ///
  /// In en, this message translates to:
  /// **'If you are facing a problem, you can send a message and we will contact you as soon as possible'**
  String get help_text;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'error'**
  String get error;

  /// No description provided for @error_text.
  ///
  /// In en, this message translates to:
  /// **'error occurred ,please try again later'**
  String get error_text;

  /// No description provided for @edit_success.
  ///
  /// In en, this message translates to:
  /// **'Edit Success'**
  String get edit_success;

  /// No description provided for @edit_success_text.
  ///
  /// In en, this message translates to:
  /// **'Edit Done Successfully'**
  String get edit_success_text;

  /// No description provided for @logout_txt.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to Logout ?'**
  String get logout_txt;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
