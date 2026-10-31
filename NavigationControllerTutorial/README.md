# NavigationControllerTutorial

## Açıklama

Bu proje, UIKit kullanılarak iOS uygulamalarında `UINavigationController` yapısının ve ekranlar arası navigasyonun öğrenilmesi amacıyla hazırlanmıştır.

Uygulamada üç farklı ekran arasında geçiş yapılmaktadır. Navigation Controller, ekranların sırasını bir navigation stack içerisinde yönetir ve kullanıcıya önceki ekrana dönme imkânı sağlar.

Ekran geçişleri Storyboard üzerinde tanımlanan Show Segue bağlantılarıyla gerçekleştirilmiştir.

## Öğrenilen Konular

### UINavigationController

`UINavigationController`, iOS uygulamalarında hiyerarşik ekran geçişlerini yönetmek için kullanılan bir container view controller'dır.

Birden fazla View Controller'ı navigation stack içerisinde tutar ve aynı anda yalnızca stack'in en üstündeki ekranı görüntüler.

Bu projede Navigation Controller, ilk sayfayı root view controller olarak yönetir ve diğer ekranlara geçişleri sağlar.

### Navigation Stack

Navigation stack, Navigation Controller tarafından yönetilen View Controller listesidir.

Temel kavramlar:

- **Root View Controller:** Navigation stack'in ilk elemanıdır.
- **Top View Controller:** Stack'in en üstünde bulunan ve görüntülenen ekrandır.
- **Push:** Yeni bir View Controller'ın stack'e eklenmesidir.
- **Pop:** Stack'in en üstündeki View Controller'ın kaldırılmasıdır.

Bu projede ekran geçişleri sırasında Show Segue kullanıldığı için yeni ekranlar navigation stack'e eklenir. Geri butonuyla önceki ekrana dönüldüğünde mevcut ekran stack'ten çıkarılır.

### Show Segue

Storyboard üzerinde View Controller'lar arasında geçiş oluşturmak için Segue kullanılır.

Bu projede iki adet Show Segue bağlantısı bulunmaktadır:

1. İlk sayfadaki buton üzerinden ikinci sayfaya geçiş.
2. İkinci sayfanın navigation bar bölümündeki sağ bar button item üzerinden üçüncü sayfaya geçiş.

Navigation Controller içerisinde kullanılan Show Segue, hedef View Controller'ı navigation stack'e push eder.

### Navigation Bar ve Navigation Item

`UINavigationController`, yönettiği ekranların üst bölümünde Navigation Bar görüntüler.

Her View Controller kendi `navigationItem` özelliği üzerinden Navigation Bar içeriğini belirleyebilir.

Bu projede:

- İlk sayfanın başlığı `İlk Sayfa`.
- İkinci sayfanın başlığı `İkinci Sayfa`.
- İkinci sayfada sol ve sağ olmak üzere iki adet Bar Button Item bulunur.
- Sağ Bar Button Item üçüncü sayfaya geçiş için kullanılır.

İkinci ve üçüncü ekranlarda sistemin sağladığı geri navigasyon butonu sayesinde önceki ekrana dönülebilir.

## Uygulama Akışı

1. Uygulama Navigation Controller ile açılır.
2. İlk sayfa, Navigation Controller'ın root view controller'ı olarak görüntülenir.
3. İlk sayfadaki butona basıldığında ikinci sayfaya geçilir.
4. İkinci sayfanın Navigation Bar bölümündeki sağ butona basıldığında üçüncü sayfa açılır.
5. Navigation Bar üzerindeki geri butonu kullanılarak önceki ekranlara dönülebilir.

## Teknolojiler

- Swift
- UIKit
- Storyboard
- UINavigationController
- Navigation Stack
- Navigation Bar
- Navigation Item
- Segue

## Öğrenme Kazanımları

- UINavigationController yapısını ve kullanım amacını anlama.
- Navigation stack mantığını öğrenme.
- Root ve top View Controller kavramlarını ayırt etme.
- Push ve pop navigasyon davranışlarını anlama.
- Storyboard üzerinden Show Segue bağlantıları oluşturma.
- Navigation Bar ve Bar Button Item kullanma.
- Navigation Item ile ekran başlıklarını ve navigasyon kontrollerini yapılandırma.