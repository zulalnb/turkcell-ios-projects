# TimerTutorial

Bu proje, Swift ve UIKit kullanılarak `Timer` sınıfının kullanımını göstermek amacıyla hazırlanmıştır.

Uygulama açıldığında 2,5 saniye aralıklarla çalışan bir zamanlayıcı başlatılır. Zamanlayıcı her tetiklendiğinde konsola mesaj yazdırılır ve çalışma sayısı artırılır. Üçüncü çalışmanın ardından zamanlayıcı durdurulur.

## Kullanılan Konseptler

### Timer

`Timer`, belirli zaman aralıklarında bir işlemin gerçekleştirilmesini sağlayan Foundation sınıfıdır.

Bu projede `Timer.scheduledTimer()` metodu kullanılarak tekrarlayan bir zamanlayıcı oluşturulmuştur.

```swift
timer = Timer.scheduledTimer(
    timeInterval: timerDuration,
    target: self,
    selector: #selector(timerDidFire),
    userInfo: nil,
    repeats: true
)
```

Parametreler:

- `timeInterval`: Zamanlayıcının kaç saniyede bir tetikleneceğini belirler.
- `target`: Tetiklenme sonucunda çağrılacak metodun bulunduğu nesnedir.
- `selector`: Zamanlayıcı tetiklendiğinde çağrılacak metodu belirtir.
- `userInfo`: Zamanlayıcıya ek bilgi aktarmak için kullanılır.
- `repeats`: Zamanlayıcının tekrarlanıp tekrarlanmayacağını belirler.

### Selector ve @objc

`Timer.scheduledTimer(timeInterval:target:selector:userInfo:repeats:)` metodunda selector kullanılarak zamanlayıcı tetiklendiğinde çalıştırılacak metot belirtilir.

Swift metodunun Objective-C runtime tarafından çağrılabilmesi için `@objc` attribute'u kullanılır.

Bu projede `timerDidFire()` metodu zamanlayıcı her tetiklendiğinde çağrılır.

### Zamanlayıcının Durdurulması

`invalidate()` metodu, zamanlayıcının çalışmasını durdurur ve timer'ı geçersiz hale getirir.

Projede `runCount` değişkeni ile zamanlayıcının kaç kez çalıştığı takip edilir.

```swift
if runCount == 3 {
    timer?.invalidate()
}
```

Üçüncü çalışmanın ardından zamanlayıcı durdurulur.

### Timer Değişkeni

```swift
var timer: Timer?
let timerDuration = 2.5
var runCount = 0
```

- `timer`: Oluşturulan Timer nesnesini saklar.
- `timerDuration`: Zamanlayıcının çalışma aralığını saniye cinsinden belirtir.
- `runCount`: Zamanlayıcının kaç kez tetiklendiğini takip eder.

## Uygulama Akışı

1. Uygulama açıldığında `viewDidLoad()` metodu çalışır.
2. `Timer.scheduledTimer()` ile 2,5 saniyelik tekrarlayan zamanlayıcı oluşturulur.
3. Her tetiklenmede `timerDidFire()` metodu çağrılır.
4. Konsola `Zaman sonu` mesajı yazdırılır.
5. `runCount` değeri bir artırılır.
6. Sayaç üçe ulaştığında `timer.invalidate()` çağrılarak zamanlayıcı durdurulur.

## Teknolojiler

- Swift
- UIKit
- Timer
- Selector
- Objective-C Runtime (`@objc`)

## Kazanımlar

- Swift'te `Timer` sınıfını kullanmak.
- Belirli zaman aralıklarında tekrarlayan işlemler gerçekleştirmek.
- `scheduledTimer()` metodunun parametrelerini anlamak.
- Selector ve `@objc` kullanımını öğrenmek.
- `invalidate()` ile zamanlayıcıyı durdurmak.
- Timer tetiklenmelerini bir sayaç üzerinden takip etmek.