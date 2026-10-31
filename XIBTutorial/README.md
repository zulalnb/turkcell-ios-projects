# XIBTutorial

Bu proje, UIKit içerisinde XIB (XML Interface Builder) dosyalarının kullanımını ve arayüz bileşenlerinin ayrı dosyalarda tasarlanmasını göstermek amacıyla hazırlanmıştır.

Projede mavi arka plana sahip, görsel ve iki UILabel içeren bir header bileşeni hem Storyboard üzerinde hem de ayrı bir XIB dosyasında tasarlanmıştır.

## Kullanılan Konseptler

### XIB (XML Interface Builder)

XIB, UIKit arayüz bileşenlerini Interface Builder üzerinden görsel olarak tasarlamaya olanak sağlayan dosya formatıdır.

Storyboard'dan farklı olarak XIB dosyaları genellikle bağımsız view bileşenlerini veya tekil ekranları tanımlamak için kullanılır.

Bu projede `V_Header.xib` dosyası içerisinde bir header görünümü oluşturulmuştur.

Header bileşeninde:

- UIImageView: Görsel göstermek için kullanılır.
- UILabel: Ad Soyad bilgisini göstermek için kullanılır.
- UILabel: Süre bilgisini göstermek için kullanılır.
- UIView: Bileşenin mavi arka planını oluşturur.

### Storyboard ve XIB

Storyboard ve XIB, UIKit arayüzlerini Interface Builder üzerinden tasarlamak için kullanılan iki farklı yaklaşımdır.

**Storyboard:**
- Bir veya daha fazla View Controller içerebilir.
- Ekranlar arasındaki geçişler ve ilişkiler görsel olarak tanımlanabilir.
- Uygulamanın ekran akışını yönetmek için kullanılabilir.

**XIB:**
- Genellikle bağımsız view bileşenleri oluşturmak için kullanılır.
- Bir arayüz bileşeninin kendi dosyasında tasarlanmasını sağlar.
- Tekrar kullanılabilir UI bileşenleri geliştirmek için tercih edilebilir.

Bu projede benzer header tasarımı hem `Main.storyboard` hem de `V_Header.xib` içerisinde oluşturularak iki yaklaşım karşılaştırılmıştır.

### UIView ve UI Components

Hem Storyboard hem de XIB içerisinde UIView tabanlı bir header alanı tasarlanmıştır.

Header içerisinde UIImageView ve UILabel bileşenleri kullanılmıştır. Böylece arayüzün farklı elemanlardan oluşan bir UIView hiyerarşisi şeklinde düzenlenmesi gösterilmiştir.

## Proje Yapısı

```text
XIBTutorial/
├── XIBTutorial.xcodeproj/
└── XIBTutorial/
    ├── Assets.xcassets/
    ├── Base.lproj/
    │   ├── LaunchScreen.storyboard
    │   └── Main.storyboard
    ├── V_Header.xib
    ├── AppDelegate.swift
    ├── SceneDelegate.swift
    └── ViewController.swift
```

- `Main.storyboard`: İki farklı View Controller içerisinde header benzeri arayüzler barındırır.
- `V_Header.xib`: Bağımsız header görünümünün tasarımını içerir.
- `ViewController.swift`: Ana View Controller sınıfıdır.

## Teknolojiler

- Swift
- UIKit
- Storyboard
- XIB
- UIView
- UIImageView
- UILabel
- Interface Builder

## Kazanımlar

- XIB dosyalarının kullanım amacını öğrenmek.
- Storyboard ve XIB arasındaki farkları anlamak.
- Arayüz bileşenlerini ayrı dosyalarda tasarlamak.
- UIView hiyerarşisini ve alt bileşenlerini düzenlemek.
- Tekrar kullanılabilir arayüz bileşenlerinin nasıl tasarlanabileceğini öğrenmek.