# TabbarControllerTutorial

Bu proje, UIKit içerisinde `UITabBarController` kullanarak sekmeli (tab bar) bir arayüz oluşturmayı göstermek amacıyla hazırlanmıştır.

Storyboard üzerinden iki farklı View Controller, Tab Bar Controller'a bağlanarak kullanıcıların sekmeler arasında geçiş yapabileceği basit bir yapı oluşturulmuştur.

## Kullanılan Konseptler

### UITabBarController

`UITabBarController`, uygulama içerisinde birden fazla ekran arasında sekmeler aracılığıyla geçiş yapılmasını sağlayan bir container view controller bileşenidir.

Bu projede iki farklı View Controller, `UITabBarController` içerisine eklenmiştir. Her View Controller kendi `UITabBarItem` bileşenine sahiptir.

### Tab Bar Item

Her sekmenin başlığını ve görselini belirlemek için `UITabBarItem` kullanılır.

Projede:

- İlk sekmenin başlığı `Başlık` olarak belirlenmiştir.
- İlk sekmede `square.and.arrow.up.on.square.fill` SF Symbol ikonu kullanılmıştır.
- İkinci sekmenin başlığı `Item` olarak belirlenmiştir.

### Badge

Badge, bir sekmenin üzerinde bildirim veya sayısal bilgi göstermek için kullanılan küçük bir işarettir.

İlk sekmenin `badgeValue` değeri `1` olarak ayarlanmış ve badge rengi pembe olarak belirlenmiştir.

### Storyboard Relationship Segue

Tab Bar Controller ile içerdiği View Controller'lar arasındaki bağlantılar Storyboard üzerinde `Relationship Segue` kullanılarak oluşturulmuştur.

Bu bağlantılar sayesinde ilgili View Controller'lar `UITabBarController` bileşeninin sekmeleri olarak tanımlanır.

## Uygulama Akışı

1. Uygulama açıldığında başlangıç ekranı olarak `UITabBarController` yüklenir.
2. Tab Bar Controller içerisinde iki View Controller bulunur.
3. İlk sekmede yeşil arka plan, `Başlık` etiketi, SF Symbol ikonu ve badge gösterilir.
4. İkinci sekmede turuncu arka plana sahip `Item` ekranı görüntülenir.
5. Kullanıcı tab bar üzerinden sekmeler arasında geçiş yapabilir.

## Teknolojiler

- Swift
- UIKit
- UITabBarController
- UITabBarItem
- Storyboard
- SF Symbols

## Kazanımlar

- `UITabBarController` ile sekmeli navigasyon yapısı oluşturmak.
- Birden fazla View Controller'ı container view controller içerisinde yönetmek.
- `UITabBarItem` ile sekme başlığı ve ikonu belirlemek.
- Badge kullanarak sekmeler üzerinde bildirim göstermek.
- Storyboard Relationship Segue bağlantılarını kullanmak.