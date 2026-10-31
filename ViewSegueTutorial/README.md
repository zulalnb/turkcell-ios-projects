# ViewSegueTutorial

Bu proje, UIKit içerisinde Storyboard kullanarak View Controller'lar arasında ekran geçişi (Segue) oluşturmayı göstermek amacıyla hazırlanmıştır.

İlk ekranda bulunan butona basıldığında Show Segue aracılığıyla ikinci ekrana geçiş yapılır.

## Kullanılan Konseptler

### UIStoryboardSegue

`UIStoryboardSegue`, Storyboard üzerinde tanımlanan View Controller geçişlerini temsil eden UIKit sınıfıdır.

Segue, kaynak View Controller ile hedef View Controller arasındaki geçişi gerçekleştirir.

Bu projede ilk ekrandaki buton ile ikinci ekran arasında Storyboard üzerinden Show Segue bağlantısı oluşturulmuştur.

### Show Segue

Show Segue, bir View Controller'dan başka bir View Controller'a geçiş yapmak için kullanılan segue türüdür.

Geçişin nasıl gerçekleştirileceği mevcut View Controller hiyerarşisine bağlıdır. Örneğin, bir `UINavigationController` içerisinde kullanıldığında yeni ekran navigation stack'e eklenir. Bir navigation controller bulunmadığında ise UIKit uygun sunum yöntemini belirler.

Bu projede Show Segue kullanılarak ikinci ekran açılır.

### Storyboard ile Segue Oluşturma

Storyboard üzerinde bir UI bileşeninden hedef View Controller'a bağlantı sürüklenerek segue oluşturulabilir.

Bu projede:

- İlk ekrana bir UIButton eklenmiştir.
- Butondan ikinci View Controller'a Show Segue bağlantısı oluşturulmuştur.
- İkinci ekrana `İkinci Ekran` metnini gösteren bir UILabel eklenmiştir.

### View Controller

Her ekran kendi View Controller'ı tarafından yönetilir.

Projede iki farklı View Controller bulunmaktadır:

- İlk View Controller: Geçişi başlatan butonu içerir.
- İkinci View Controller: `İkinci Ekran` metnini gösteren UILabel içerir.

## Uygulama Akışı

1. Uygulama açıldığında ilk View Controller görüntülenir.
2. Kullanıcı ekrandaki Button butonuna basar.
3. Storyboard üzerinde tanımlanan Show Segue tetiklenir.
4. İkinci View Controller oluşturulur ve ekrana sunulur.
5. İkinci ekranda `İkinci Ekran` metni görüntülenir.

## Teknolojiler

- Swift
- UIKit
- UIViewController
- UIStoryboard
- UIStoryboardSegue
- Storyboard
- Show Segue

## Kazanımlar

- Storyboard üzerinden Segue oluşturmak.
- View Controller'lar arasında ekran geçişi gerçekleştirmek.
- Show Segue'nin kullanımını ve çalışma mantığını öğrenmek.
- UIKit içerisinde View Controller sunum yöntemlerini anlamak.