# ProgrammaticLoginUI

Bu proje, UIKit kullanılarak Storyboard kullanmadan arayüz elemanlarının Swift kodu ile oluşturulmasını ve Auto Layout ile konumlandırılmasını göstermek amacıyla hazırlanmıştır.

Ekranda kullanıcı adı ve şifre alanları ile giriş yap butonu bulunan basit bir giriş arayüzü oluşturulmuştur.

## Kullanılan Konseptler

### Programmatic UI

Programmatic UI, arayüz elemanlarının Interface Builder veya Storyboard yerine kod kullanılarak oluşturulmasıdır.

Bu projede `UITextField` ve `UIButton` nesneleri `ViewController.swift` içerisinde oluşturulmuş ve `view.addSubview()` metodu ile ana görünüme eklenmiştir.

- `UITextField`: Kullanıcı adı ve şifre giriş alanları.
- `UIButton`: Giriş yap butonu.

### UITextField

Kullanıcıdan metin girişi almak için kullanılan UIKit bileşenidir.

Bu projede iki adet `UITextField` oluşturulmuştur:

- Kullanıcı adı alanı (`Kullanıcı Adı`)
- Şifre alanı (`Şifre`)

Text field bileşenlerinin placeholder, arka plan rengi, metin rengi, kenarlık stili ve font özellikleri kod üzerinden ayarlanmıştır.

### UIButton

Kullanıcının etkileşimde bulunabileceği bir buton oluşturmak için kullanılmıştır.

Butonun başlığı `setTitle()` metodu, arka plan rengi ise `backgroundColor` özelliği ile belirlenmiştir.

### Auto Layout

Arayüz elemanlarının farklı ekran boyutlarına ve konumlarına göre yerleştirilmesini sağlamak için Auto Layout kullanılmıştır.

Bu projede `NSLayoutConstraint` ve `NSLayoutConstraint.activate()` kullanılarak constraint tanımlamaları yapılmıştır.

- Kullanıcı adı alanı ekranın yatay merkezine hizalanmıştır.
- Dikey konumu ekranın merkezinden 150 point yukarıda olacak şekilde ayarlanmıştır.
- Genişliği ekran genişliğinin %80'i olarak belirlenmiştir.
- Kullanıcı adı ve şifre alanları arasında 10 point boşluk bırakılmıştır.
- Giriş yap butonu şifre alanının hemen altında konumlandırılmıştır.
- Üç bileşenin yüksekliği 50 point olarak belirlenmiştir.

### translatesAutoresizingMaskIntoConstraints

Programmatic UI oluştururken Auto Layout constraint'leri kullanabilmek için ilgili view bileşenlerinin `translatesAutoresizingMaskIntoConstraints` özelliği `false` olarak ayarlanmıştır.

Bu sayede UIKit, autoresizing mask üzerinden otomatik constraint üretmek yerine tanımladığımız Auto Layout constraint'lerini kullanır.

## Uygulama Akışı

1. Uygulama açıldığında `ViewController` içerisinde `viewDidLoad()` metodu çalışır.
2. Kullanıcı adı ve şifre alanları `UITextField` ile oluşturulur.
3. Giriş yap butonu `UIButton` ile oluşturulur.
4. Oluşturulan bileşenler ana view içerisine eklenir.
5. Auto Layout constraint'leri tanımlanarak bileşenlerin konumları ve boyutları belirlenir.

## Teknolojiler

- Swift
- UIKit
- Auto Layout
- NSLayoutConstraint
- UITextField
- UIButton

## Kazanımlar

- Storyboard kullanmadan UIKit bileşenleri oluşturmak.
- `UIView` hiyerarşisine programatik olarak bileşen eklemek.
- `UITextField` ve `UIButton` bileşenlerini yapılandırmak.
- `NSLayoutConstraint` ile Auto Layout kullanmak.
- Constraint'ler aracılığıyla bileşenler arasında konum ve boyut ilişkileri kurmak.