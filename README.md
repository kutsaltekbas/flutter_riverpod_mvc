# Flutter'da Riverpod ve MVC-S pattern kullanarak basit login uygulaması oluşturalım

Bu uygulama Flutter frameworkünde MVC-S yapısını kullanarak login işlemi yapmayı ve bir dizi kullanıcıyı API üzerinden çekmeyi sağlar. Uygulamadaki core klasörü, uygulamadan bağımsız ve taşınabilir dart dosyalarını içerir. Features klasörü ise bu uygulamada kullanılan MVC-S (Model - View - Controller / Service) dosyalarını içerir.


# Kurulum

İlk olarak uygulamamızdaki gerekli paketleri elde etmek için '**flutter pub get**' komutunu kullanmamız gerekiyor. Daha sonra easy localization paketimizin oluşturacağı dil dosyaları için '**dart  run  easy_localization:generate  -O  lib/core/init/lang  -f  keys  -o  locale_keys.g.dart  --source-dir  assets/languages**' komutunu çalıştırıyoruz. Dil dosyalarımızı tamamladığımıza göre artık son işlemimiz olan .gr uzantılı dosyalarımızı oluşturmak için ilgili extension veya '**dart  run  build_runner  watch**' build_runner paketimizi aktif hale getiriyoruz. Dosyalarımız oluşturulduktan sonra artık her şey hazır ! Uygulamayı denemeye veya istediğiniz gibi özelleştirmeye başlayabilirsiniz.
