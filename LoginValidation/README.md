# LoginValidation

## Açıklama

Bu proje, UIKit kullanılarak oluşturulan basit bir login ekranında kullanıcı adı ve şifre doğrulama işlemlerini gerçekleştirmek amacıyla hazırlanmıştır.

Kullanıcı giriş butonuna bastığında öncelikle kullanıcı adı ve şifre alanlarının boş olup olmadığı kontrol edilir. Alanlar doluysa girilen bilgiler belirlenen değerlerle karşılaştırılır ve giriş işleminin başarılı veya başarısız olduğu konsola yazdırılır.

## Öğrenilen Konular

### UITextField

`UITextField`, kullanıcıdan metin girdisi almak için kullanılan UIKit bileşenidir.

Bu projede iki adet TextField kullanılmıştır:

- `tfUsername`: Kullanıcı adı girişi.
- `tfPassword`: Şifre girişi.

TextField içerisindeki değerlere `.text` özelliği üzerinden erişilir.

### IBOutlet ve IBAction

Storyboard üzerindeki UI bileşenleri ile Swift kodu arasında bağlantı kurmak için IBOutlet ve IBAction kullanılır.

Bu projede:

- `tfUsername` ve `tfPassword` IBOutlet bağlantılarıyla View Controller'a bağlanmıştır.
- `btnLogin_TUI` IBAction metodu, giriş butonuna basıldığında çalışır.

### Conditional Statements

Giriş işleminin kontrolü için iç içe `if-else` yapıları kullanılmıştır.

İlk olarak kullanıcı adı ve şifre alanlarının boş olup olmadığı kontrol edilir:

```swift
if tfUsername.text != "" && tfPassword.text != "" {
    // Değer kontrolü
} else {
    print("Kullanıcı adı ve şifre boş olamaz")
}
```

`&&` (AND) operatörü sayesinde her iki alanın da dolu olması beklenir.

Alanlar doluysa kullanıcı adı ve şifre kontrol edilir:

```swift
if tfUsername.text == "a" && tfPassword.text == "s" {
    print("Giriş Başarılı")
} else {
    print("Giriş Başarısız")
}
```

Her iki değer de beklenen değerlerle eşleştiğinde giriş başarılı kabul edilir.

## Uygulama Akışı

1. Uygulama kullanıcı adı ve şifre alanlarının bulunduğu login ekranıyla açılır.
2. Kullanıcı giriş bilgilerini girer.
3. Giriş Yap butonuna basılır.
4. Öncelikle iki alanın da boş olup olmadığı kontrol edilir.
5. Alanlardan biri veya ikisi boşsa konsola `Kullanıcı adı ve şifre boş olamaz` mesajı yazdırılır.
6. Alanlar doluysa kullanıcı adı ve şifre kontrol edilir.
7. Kullanıcı adı `a`, şifre `s` ise `Giriş Başarılı`; aksi durumda `Giriş Başarısız` mesajı konsola yazdırılır.

## Teknolojiler

- Swift
- UIKit
- Storyboard
- UITextField
- IBOutlet / IBAction
- Conditional Statements

## Öğrenme Kazanımları

- UITextField üzerinden kullanıcı girdilerini alma.
- IBOutlet ve IBAction bağlantılarını kullanma.
- String değerlerini karşılaştırma.
- `if-else` koşul yapılarını kullanma.
- `&&` operatörüyle birden fazla koşulu kontrol etme.
- Basit form doğrulama mantığını uygulama.