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

Bu projede zamanlayıcı her 2,5 saniyede bir çalışacak şekilde yapılandırılmıştır.

### Selector ve @objc

`Timer.scheduledTimer(timeInterval:target:selector:userInfo:repeats:)` metodunda selector kullanılarak zamanlayıcı tetiklendiğinde çalıştırılacak metot belirtilir.

Swift metodunun Objective-C runtime tarafından selector aracılığıyla çağrılabilmesi için `@objc` attribute'u kullanılır.

```swift
@objc func timerDidFire() {
    print("Zaman sonu")

    runCount += 1

    if runCount == 3 {
        timer?.invalidate()
    }
}
```

Bu projede `timerDidFire()` metodu zamanlayıcı her tetiklendiğinde çağrılır.

### Block-Based Timer Kullanımı

`Timer` sınıfı yalnızca `target` ve `selector` yaklaşımıyla kullanılmaz. Closure (block) tabanlı bir kullanım alternatifi de bulunur.

Projede `viewDidLoad()` içerisinde yorum satırına alınmış aşağıdaki kod bu alternatif yaklaşımı göstermektedir:

```swift
// timer = Timer.scheduledTimer(
//     withTimeInterval: timerDuration,
//     repeats: true,
//     block: timerDidFinish
// )
```

Bu kullanımda:

- `withTimeInterval`: Zamanlayıcının çalışma aralığını belirtir.
- `repeats`: Zamanlayıcının tekrarlanıp tekrarlanmayacağını belirler.
- `block`: Zamanlayıcı tetiklendiğinde çalıştırılacak closure veya uyumlu fonksiyon referansıdır.

Bu kodda `timerDidFinish` metodu callback olarak aktarılır:

```swift
func timerDidFinish(t: Timer) {
    print("Zaman sonu")

    runCount += 1

    if runCount == 3 {
        timer?.invalidate()
    }
}
```

Buradaki `t: Timer` parametresi, callback çağrıldığında çalışan Timer nesnesini temsil eder.

**Selector ve Block-Based yaklaşım arasındaki fark**

| Selector-Based | Block-Based |
|---|---|
| `target` ve `selector` kullanır. | Closure veya fonksiyon referansı kullanır. |
| Çağrılacak metot `@objc` ile işaretlenmelidir. | `@objc` gerektirmez. |
| `Timer.scheduledTimer(timeInterval:target:selector:userInfo:repeats:)` kullanılır. | `Timer.scheduledTimer(withTimeInterval:repeats:block:)` kullanılır. |

İki yaklaşım da belirli aralıklarla bir işlemi çalıştırmak için kullanılabilir.

Bu projede aktif olarak selector-based yöntem kullanılmaktadır. Block-based örnek ise alternatif Timer kullanımını göstermek amacıyla yorum satırına alınmıştır.

### Zamanlayıcının Durdurulması

`invalidate()` metodu, zamanlayıcının çalışmasını durdurur ve timer'ı geçersiz hale getirir.

Projede `runCount` değişkeni ile zamanlayıcının kaç kez çalıştığı takip edilir.

```swift
if runCount == 3 {
    timer?.invalidate()
}
```

Üçüncü çalışmanın ardından zamanlayıcı durdurulur.

`invalidate()` çağrısından sonra aynı Timer nesnesi tekrar çalıştırılamaz. Yeni bir zamanlayıcı oluşturulması gerekir.

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
- Foundation
- Timer
- Selector
- Closure / Block
- Objective-C Runtime (`@objc`)

## Kazanımlar

- Swift'te `Timer` sınıfını kullanmak.
- Belirli zaman aralıklarında tekrarlayan işlemler gerçekleştirmek.
- `scheduledTimer()` metodunun farklı kullanım biçimlerini anlamak.
- Selector ve `@objc` kullanımını öğrenmek.
- Block-based Timer yaklaşımını tanımak.
- `invalidate()` ile zamanlayıcıyı durdurmak.
- Timer tetiklenmelerini bir sayaç üzerinden takip etmek.