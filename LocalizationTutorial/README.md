# LocalizationTutorial

## Açıklama

Bu proje, iOS uygulamalarında çoklu dil desteğinin (Localization) nasıl yapılandırıldığını öğrenmek amacıyla hazırlanmıştır.

Uygulamada Storyboard üzerinde oluşturulan bir arayüz elemanının Türkçe ve İngilizce karşılıkları tanımlanmıştır. Kullanıcının cihazında tercih ettiği dile göre uygulamanın arayüz metni ilgili dilde görüntülenir.

## Öğrenilen Konular

### Localization

Localization, bir uygulamanın farklı dilleri ve bölgesel ayarları destekleyecek şekilde uyarlanmasıdır. iOS uygulamalarında Xcode üzerinden farklı dil seçenekleri eklenebilir ve arayüz metinleri her dil için ayrı ayrı tanımlanabilir.

Bu projede İngilizce (`en`) ve Türkçe (`tr`) yerelleştirmeleri kullanılmıştır.

### Base Localization ve .lproj Klasörleri

Storyboard tabanlı yerelleştirmede `Base.lproj` klasörü, arayüzün temel tanımını içeren Storyboard dosyasını barındırır.

Her dil için oluşturulan `.lproj` klasörleri ise ilgili dile ait çeviri dosyalarını içerir.

Projedeki dosya yapısı:

- `Base.lproj/Main.storyboard`: Arayüzün temel tanımı.
- `en.lproj/Main.strings`: İngilizce çeviriler.
- `tr.lproj/Main.strings`: Türkçe çeviriler.

### Main.strings

Xcode, yerelleştirilmiş Storyboard dosyalarındaki metinler için dil bazlı `.strings` dosyaları oluşturur.

Bu dosyalarda arayüz elemanlarının metinleri anahtar-değer eşleşmesiyle tanımlanır.

Örneğin:

**en.lproj/Main.strings**
```text
"rbV-2h-72k.text" = "Welcome";
```

**tr.lproj/Main.strings**
```text
"rbV-2h-72k.text" = "Hoşgeldiniz";
```

Buradaki anahtar, Storyboard içerisindeki ilgili arayüz elemanının Object ID değeri ve yerelleştirilen özelliğinden oluşur.

Bu sayede aynı Storyboard yapısı korunurken farklı dillerde farklı metinler gösterilebilir.

## Uygulama Akışı

1. Xcode proje ayarlarından İngilizce ve Türkçe dil desteği tanımlanır.
2. Storyboard üzerinde bir `UILabel` oluşturulur.
3. Label'ın metni, ilgili dilin `Main.strings` dosyasında çevrilir.
4. Uygulama çalıştırıldığında cihazın tercih edilen diliyle eşleşen yerelleştirme kullanılır.

## Teknolojiler

- Swift
- UIKit
- Storyboard
- Xcode Localization
- `.strings` Dosyaları

## Öğrenme Kazanımları

- iOS uygulamalarına çoklu dil desteği ekleme.
- Xcode üzerinden proje yerelleştirmelerini yapılandırma.
- Base Localization yapısını anlama.
- `.lproj` klasörlerinin ve `.strings` dosyalarının kullanımını öğrenme.
- Storyboard üzerindeki arayüz metinlerini farklı dillere uyarlama.