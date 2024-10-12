import 'package:get/get.dart';
import 'package:stunting_app/app/bindings/auth/EmailVerifBinding.dart';
import 'package:stunting_app/app/bindings/auth/LoginBinding.dart';
import 'package:stunting_app/app/bindings/auth/RegisterBinding.dart';
import 'package:stunting_app/app/bindings/auth/RegisterDataBinding.dart';
import 'package:stunting_app/app/bindings/mainpage/CommunityBindings.dart';
import 'package:stunting_app/app/bindings/mainpage/ConsultationBinding.dart';
import 'package:stunting_app/app/bindings/mainpage/MainBinding.dart';
import 'package:stunting_app/app/bindings/mainpage/ProfileBinding.dart';
import 'package:stunting_app/app/bindings/menu/BookImunisasiBinding.dart';
import 'package:stunting_app/app/bindings/menu/artikel/ArtikelBinding.dart';
import 'package:stunting_app/app/bindings/menu/data_anak/TambahDataAnakBinding.dart';
import 'package:stunting_app/app/bindings/menu/data_anak/UpdateDataAnakBinding.dart';
import 'package:stunting_app/app/bindings/menu/maps/MapsPemetaanBinding.dart';
import 'package:stunting_app/app/bindings/menu/resep/ResepBinding.dart';
import 'package:stunting_app/app/views/BlankPage.dart';
import 'package:stunting_app/app/views/auth/EmailVerifPage.dart';
import 'package:stunting_app/app/views/auth/LoginPage.dart';
import 'package:stunting_app/app/views/auth/RegisterDataPage.dart';
import 'package:stunting_app/app/views/auth/RegisterPage.dart';
import 'package:stunting_app/app/views/form/data_anak/FormTambahDataAnak.dart';
import 'package:stunting_app/app/views/form/data_anak/FormUpdateDataAnak.dart';
import 'package:stunting_app/app/views/mainpage/MainPage.dart';
import 'package:stunting_app/app/views/menu/BookImunisasiPage.dart';
import 'package:stunting_app/app/views/menu/artikel/ArtikelMainPage.dart';
import 'package:stunting_app/app/views/menu/artikel/detail/ArtikelDetailPage.dart';
import 'package:stunting_app/app/views/menu/community/CreateThreads.dart';
import 'package:stunting_app/app/views/menu/community/DetailThread.dart';
import 'package:stunting_app/app/views/menu/consulatation/DetailConsultation.dart';
import 'package:stunting_app/app/views/menu/consulatation/ReviewConsultation.dart';
import 'package:stunting_app/app/views/menu/consulatation/SuccessTransaksi.dart';
import 'package:stunting_app/app/views/menu/maps/MapsPemetaan.dart';
import 'package:stunting_app/app/views/menu/profile/DetailProfilePage.dart';
import 'package:stunting_app/app/views/menu/resep/ResepAllPage.dart';
import 'package:stunting_app/app/views/menu/resep/ResepDetailPage.dart';
import 'package:stunting_app/app/views/menu/setting/PusatBantuanPage.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/register',
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/email-verification',
      page: () => const EmailVerifPage(),
      binding: EmailVerifBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: "/register-data",
        page: () => const RegisterDataPage(),
        binding: RegisterDataBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: '/mainpage',
      page: () => const MainPage(),
      binding: IndexMainBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/booking-vaksin',
      page: () => const BookImunisasiPage(),
      transition: Transition.fadeIn,
      binding: BookImunisasiBinding(),
    ),
    GetPage(
      name: '/tambah-anak',
      page: () => const FormTambahDataAnak(),
      transition: Transition.fadeIn,
      binding: TambahDataAnakBinding(),
    ),
    GetPage(
      name: '/update-anak/:id',
      page: () => const FormUpdateDataAnak(),
      transition: Transition.fadeIn,
      binding: UpdateDataAnakBinding(),
    ),
    GetPage(
      name: '/artikel',
      page: () => const ArtikelMainPage(),
      transition: Transition.fadeIn,
      binding: ArtikelBinding(),
    ),
    GetPage(
      name: '/artikel/:id',
      page: () => const ArtikelDetailPage(),
      transition: Transition.fadeIn,
      binding: ArtikelBinding(),
    ),
    GetPage(
      name: '/resep',
      page: () => const ResepAllPage(),
      transition: Transition.fadeIn,
      binding: ResepBinding(),
    ),
    GetPage(
      name: '/resep/:id',
      page: () => const ResepDetailPage(),
      transition: Transition.fadeIn,
      binding: ResepBinding(),
    ),
    GetPage(
      name: '/pemetaan',
      page: () => const MapsPemetaan(),
      transition: Transition.fadeIn,
      binding: MapsPemetaanBinding(),
    ),
    GetPage(
      name: '/profile',
      page: () => const DetailProfilePage(),
      transition: Transition.fadeIn,
      binding: ProfileBinding(),
    ),
    GetPage(
      name: '/consultation',
      page: () => const DetailConsultation(),
      transition: Transition.fadeIn,
      binding: ConsultationBinding(),
    ),
    GetPage(
      name: '/consultation/review',
      page: () => const ReviewConsultation(),
      transition: Transition.fadeIn,
      binding: ConsultationBinding(),
    ),
    GetPage(
      name: '/transaksi/:status',
      page: () => const SuccessTransaksi(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/create-thread',
      page: () => const CreateThreads(),
      transition: Transition.fadeIn,
      binding: CommunityBindings(),
    ),
    GetPage(
      name: '/detail-thread/:id',
      page: () => const DetailThread(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: "/blank-page",
      page: () => const BlankPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: "/pusat-bantuan",
      page: () => const PusatBantuanPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
