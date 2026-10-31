# LoginNavigationFlow

## Açıklama

Bu proje, UIKit kullanılarak temel bir login ve ekranlar arası navigasyon akışının oluşturulmasını amaçlamaktadır.

Uygulamada kullanıcı adı ve şifre alanlarının bulunduğu bir giriş ekranı yer alır. Girilen bilgilere göre kullanıcı ana sayfaya veya üye ol ekranına yönlendirilir.

Navigasyon işlemleri `UINavigationController` ve Storyboard üzerinde tanımlanan Segue bağlantıları kullanılarak gerçekleştirilir.

## Öğrenilen Konular

### UINavigationController

`UINavigationController`, uygulama içerisindeki ekranlar arasında hiyerarşik navigasyon sağlayan bir container view controller'dır.

Ekranları bir navigation stack içerisinde tutar. Yeni bir ekran açıldığında mevcut ekranın üzerine eklenir. Geri navigasyon yapıldığında ise en üstteki ekran stack'ten çıkarılır.

Bu projede Navigation Controller, login ekranından diğer ekranlara geçişleri yönetmek için kullanılmıştır.

### Navigation Stack

Navigation stack, Navigation Controller tarafından yönetilen View Controller listesidir.

- **Root View Controller:** Stack'in ilk elemanıdır.
- **Top View Controller:** O anda görüntülenen, stack'in son elemanıdır.
- **Push:** Yeni bir View Controller'ı stack'e ekler.
- **Pop:** En üstteki View Controller'ı stack'ten çıkarır.

Bu projede başarılı giriş sonrasında login ekranının navigation stack içerisinden kaldırılması için aşağıdaki kod kullanılmıştır:

```swift
navigationController?.viewControllers.remove(at: 0)
```

Böylece ana sayfaya geçildikten sonra kullanıcı geri navigasyon ile login ekranına dönemez.

### Segue ve performSegue

Storyboard üzerinde View Controller'lar arasında tanımlanan geçişlere Segue denir.

Bu projede iki farklı Show Segue kullanılmıştır:

- `sgHome`: Login ekranından ana sayfaya geçiş.
- `sgSignUp`: Login ekranından üye ol ekranına geçiş.

Geçişler `performSegue(withIdentifier:sender:)` metodu ile programatik olarak başlatılır.

```swift
performSegue(withIdentifier: "sgHome", sender: nil)
```

Segue identifier kullanılarak hangi ekranın açılacağı belirlenir.

### IBOutlet ve IBAction

Storyboard üzerindeki arayüz elemanlarına Swift kodu üzerinden erişmek ve kullanıcı etkileşimlerini yönetmek için IBOutlet ve IBAction kullanılır.

Bu projede:

- `tfUsername`: Kullanıcı adı TextField'ı.
- `tfPassword`: Şifre TextField'ı.
- `btnSignIn_TUI`: Giriş butonunun tıklanma aksiyonu.

TextField değerleri üzerinden giriş kontrolü gerçekleştirilir.

## Uygulama Akışı

1. Uygulama Navigation Controller içerisinde tanımlanmış login ekranıyla açılır.
2. Kullanıcı adı ve şifre alanlarına bilgi girilir.
3. Giriş butonuna basıldığında girilen bilgiler kontrol edilir.
4. Kullanıcı adı ve şifre `a` ise `sgHome` Segue'si ile ana sayfaya geçilir.
5. Başarılı giriş sonrasında login ekranı navigation stack içerisinden kaldırılır. Böylece ana sayfadan login ekranına geri dönülemez.
6. Bilgiler `a` değerinden farklıysa `sgSignUp` Segue'si ile üye ol ekranına geçilir.
7. Üye ol ekranından navigation bar üzerindeki geri butonuyla login ekranına dönülebilir.

## Teknolojiler

- Swift
- UIKit
- Storyboard
- UINavigationController
- Navigation Stack
- Segue

## Öğrenme Kazanımları

- Navigation Controller ve navigation stack yapısını anlama.
- Push ve pop navigasyon mantığını öğrenme.
- Storyboard üzerinden Segue bağlantıları oluşturma.
- `performSegue` ile programatik ekran geçişleri gerçekleştirme.
- Navigation stack içerisindeki View Controller'ları yönetme.
- Kullanıcı girişine göre farklı ekranlara yönlendirme yapma.