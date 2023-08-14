import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_image.dart';

class AbautScreen extends StatelessWidget {
  const AbautScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Image.asset(AppImage.d_r, height: 100.h, width: 190.w),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 221, 133, 2),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: const Text("""
      Dreamwood ombori: Barqaror yog'och yechimlari uchun sizning manbangiz
      
      Yuqori sifatli, barqaror yog'och mahsulotlari uchun asosiy manzilingiz bo'lgan Dreamwood  -ga xush kelibsiz. Biz hunarmandlar, hunarmandlar va quruvchilarga xizmat ko'rsatadigan nafis yog'och materiallarining yetakchi yetkazib beruvchisi ekanligimizdan faxrlanamiz.
      
      Bizning hikoyamiz: Dreamwood  omborida biz yog'ochdan yasalgan buyumlar orqali tabiat go'zalligini saqlash va targ'ib qilishga chuqur ishtiyoqimiz bor. Bizning sayohatimiz barqaror o'rmonlardan olinadigan yuqori sifatli yog'och uchun bir martalik manzilni yaratish niyatidan boshlandi. Biz abadiy hunarmandchilik va eko-ongli amaliyotlar o'rtasida mukammal muvozanatni saqlashga ishonamiz.
      
      Mahsulotlarimiz: Nozik yog'ochlar va misli ko'rilmagan hunarmandchilik dunyosiga qadam qo'ying. Bizning keng kollektsiyamiz turli xil yog'och turlarini, jumladan, eman, qarag'ay, sadr, chinor va boshqalarni o'z ichiga oladi. Har bir parcha o'zining ajoyib sifati, chidamliligi va noyob don naqshlari uchun ehtiyotkorlik bilan tanlangan.
      
      Siz mebel, taxta, taxta yoki yog'ochga ishlov berish bo'yicha biron bir loyiha ustida ishlayapsizmi, bizning yog'och tanlovimiz, albatta, sizning ijodingizni ilhomlantiradi. Xom yog'ochdan nozik tayyor yog'ochgacha, biz sizning maxsus ehtiyojlaringizni qondirish uchun mo'ljallangan keng qamrovli mahsulotlarni taklif etamiz.
      
      Barqarorlik majburiyati: Dreamwood  omborida biz ekologik barqarorlikka sodiqmiz. Bizning yog'ochlarimiz axloqiy jihatdan mas'uliyat bilan boshqariladigan o'rmonlardan olinadi, bu bizning qimmatli ekotizimimizga minimal ta'sirni ta'minlaydi. Mahsulotlarimizni tanlash orqali siz o'rmonlarimiz tabiiy go'zalligini avlodlar uchun saqlab qolishda bizga qo'shilasiz.
      
      Mijozlarga yo'naltirilgan yondashuv: mijozlar ehtiyojini qondirishga sodiqligimiz bizni alohida ajratib turadi. Bilimli yog'och bo'yicha mutaxassislar jamoasi bilan biz har doim sizga topishda yordam berishga tayyormiz
      
      
      DreamWood hamjamiyatiga qo'shiling: Biz
       
      Tajriba: Biznig tajriba 5-yidan yuqori 

      Qilish: +998(97) 123 33 23 
      
      Bizning Omborga tashrif buyuring: Tashkent Ibn Sino              Mavzesi"""),
        ),
      ),
    );
  }
}
