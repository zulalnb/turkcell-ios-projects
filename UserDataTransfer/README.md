# UserDataTransfer

Bu proje, UIKit kullanılarak View Controller'lar arasında veri aktarımının nasıl gerçekleştirildiğini göstermek amacıyla hazırlanmıştır.

İlk ekranda kullanıcıdan ad, soyad ve giriş kodu alınır. Girilen kod `123` olduğunda kullanıcı ikinci ekrana yönlendirilir ve ad-soyad bilgisi ikinci ekranda görüntülenir.

## Kullanılan Konseptler

### IBOutlet ve IBAction

Storyboard üzerindeki arayüz elemanlarına Swift kodu üzerinden erişmek ve kullanıcı etkileşimlerini yönetmek için kullanılır.

Bu projede:

- `tfFirstName`: Ad bilgisini almak için kullanılan UITextField.
- `tfLastName`: Soyad bilgisini almak için kullanılan UITextField.
- `tfCode`: Giriş kodunu almak için kullanılan UITextField.
- `btnLogin_TUI`: Giriş butonuna basıldığında çalışan IBAction metodu.

### Segue

Segue, Storyboard üzerinde View Controller'lar arasında geçiş yapmak için kullanılan bağlantıdır.

Bu projede `sgPassUserData` identifier değerine sahip bir Show Segue tanımlanmıştır.

Giriş kodu `123` olduğunda `performSegue(withIdentifier:sender:)` metodu çağrılarak ikinci ekrana geçiş yapılır.

```swift
if tfCode.text == "123" {
    performSegue(withIdentifier: "sgPassUserData", sender: nil)
}
```

### prepare(for:sender:)

`prepare(for:sender:)`, bir Segue gerçekleşmeden hemen önce hedef View Controller'a veri aktarmak veya hedef ekranı yapılandırmak için kullanılan UIViewController metodudur.

Bu projede hedef View Controller'a erişmek ve ad-soyad bilgisini aktarmak için kullanılmıştır.

```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "sgPassUserData" {
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.fullname = tfFirstName.text! + " " + tfLastName.text!
    }
}
```

- `segue.identifier`: Gerçekleşen Segue'nin identifier değerini kontrol eder.
- `segue.destination`: Geçiş yapılacak hedef View Controller'ı temsil eder.
- `as! WelcomeViewController`: Hedef View Controller'ı `WelcomeViewController` tipine dönüştürür.
- `fullname`: Hedef ekrana aktarılacak ad-soyad bilgisini tutar.

### View Controller'lar Arasında Veri Aktarımı

Bir View Controller'dan diğerine veri aktarmak için hedef View Controller içerisinde bir property tanımlanabilir.

Bu projede `WelcomeViewController` içerisinde `fullname` adında optional bir String property bulunmaktadır.

```swift
var fullname: String?
```

İlk ekranda oluşturulan ad-soyad bilgisi bu property üzerinden ikinci ekrana aktarılır.

İkinci ekranda `viewDidLoad()` içerisinde UILabel'ın text değeri güncellenir:

```swift
lblFullname.text = fullname
```

Böylece ilk ekranda girilen kullanıcı bilgisi ikinci ekranda görüntülenir.

## Uygulama Akışı

1. Uygulama açıldığında kullanıcıdan ad, soyad ve giriş kodu istenir.
2. Kullanıcı Giriş Yap butonuna basar.
3. Girilen kodun `123` olup olmadığı kontrol edilir.
4. Kod doğruysa `sgPassUserData` Segue'si tetiklenir.
5. `prepare(for:sender:)` metodu çalışır ve ad-soyad bilgisi `WelcomeViewController` içerisine aktarılır.
6. İkinci ekran açıldığında aktarılan bilgi UILabel üzerinde görüntülenir.

## Teknolojiler

- Swift
- UIKit
- UIViewController
- UITextField
- UILabel
- IBOutlet / IBAction
- UIStoryboardSegue
- prepare(for:sender:)

## Kazanımlar

- View Controller'lar arasında veri aktarımını öğrenmek.
- Storyboard Segue kullanarak ekranlar arasında geçiş yapmak.
- `performSegue(withIdentifier:sender:)` metodunu kullanmak.
- `prepare(for:sender:)` metodunun çalışma mantığını anlamak.
- Hedef View Controller'a property üzerinden veri aktarmak.
- Optional property kullanımı ve UILabel üzerinden veri görüntülemek.