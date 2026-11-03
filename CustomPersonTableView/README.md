# CustomPersonTableView

Swift ve UIKit kullanılarak geliştirilen, kişi bilgilerini özel tasarlanmış UITableView hücreleri içerisinde görüntüleyen bir iOS uygulaması.

Bu proje, standart UITableView hücreleri yerine XIB kullanarak özel hücre tasarlamayı, bu hücreleri Swift koduyla yüklemeyi ve model verilerini hücrelere aktarmayı öğrenmek amacıyla hazırlanmıştır.

## Ekran Görüntüsü

<p align="center">
  <img src="./screenshots/home.png" alt="Custom Person Table View" width="300">
</p>

## Özellikler

- Kişileri UITableView içerisinde listeleme
- Kişilerin ad ve soyad bilgilerini görüntüleme
- Cinsiyet bilgisine göre farklı görseller kullanma
- XIB ile özel UITableViewCell tasarlama
- Model nesnelerinden alınan verileri özel hücrelere aktarma

---

## UITableView ve Data Source

`UITableView`, iOS uygulamalarında verileri satırlar halinde görüntülemek için kullanılan UIKit bileşenidir.

UITableView kendi başına veri saklamaz. Görüntülenecek verileri bir veri kaynağından alır. Bu sorumluluk genellikle `UITableViewDataSource` protokolü tarafından yerine getirilir.

Projede `ViewController`, hem `UITableViewDataSource` hem de `UITableViewDelegate` protokollerini uygular.

### numberOfRowsInSection

```swift
func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
) -> Int {
    return personList.count
}
```

Bu metot, UITableView'in ilgili bölümde kaç satır göstereceğini belirler.

Kişi sayısı `personList` dizisinden alındığı için satır sayısı dinamik olarak belirlenir.

### cellForRowAt

`cellForRowAt`, UITableView'in görüntüleyeceği satırlar için hücre hazırladığı metottur.

Bu projede standart UITableViewCell yerine XIB üzerinden oluşturulan özel hücre kullanılır.

Bu metodun detaylarını özel hücre bölümünde inceleyebiliriz.

### Data Source ve Delegate bağlantıları

Storyboard üzerinde UITableView'in `dataSource` ve `delegate` bağlantıları ViewController'a yapılmıştır.

- `dataSource`: Tabloya kaç satır gösterileceğini ve satırların içeriğini bildirir.
- `delegate`: Satır seçimi, hücre yüksekliği ve diğer tablo etkileşimlerini yönetir.

Bu iki protokol farklı sorumluluklara sahiptir. Bir ViewController her ikisini de uygulayabilir.

---

## Custom UITableViewCell

UITableView'in varsayılan hücreleri temel listeleme ihtiyaçları için yeterlidir. Ancak özel bir arayüz tasarlamak istediğimizde kendi UITableViewCell alt sınıfımızı oluşturabiliriz.

Bu projede her kişi satırında iki bileşen bulunur:

- Kişinin cinsiyetini temsil eden UIImageView
- Kişinin adını ve soyadını gösteren UILabel

Bu tasarım için `PersonTableViewCell` adında özel bir hücre sınıfı oluşturulmuştur.

### PersonTableViewCell.swift

```swift
import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var genderImageView: UIImageView!
    @IBOutlet weak var fullnameLabel: UILabel!

}
```

`PersonTableViewCell`, `UITableViewCell` sınıfından türetilmiştir. Böylece standart tablo hücresinin davranışları korunurken özel arayüz bileşenleri de kullanılabilir.

XIB içerisindeki UIImageView ve UILabel, IBOutlet bağlantılarıyla bu sınıfa bağlanmıştır.

**Neden özel UITableViewCell oluşturuyoruz?**

Hücre tasarımını ViewController'dan ayırmak, kodun sorumluluklarını bölerek daha düzenli ve yeniden kullanılabilir bir yapı oluşturur.

Örneğin aynı kişi hücresi başka bir ekranda da kullanılabilir. Tasarım değişiklikleri için ViewController kodunu değiştirmek gerekmez.

---

## XIB ile Özel Hücre Tasarlama

XIB, Interface Builder kullanılarak arayüz bileşenlerinin görsel olarak tasarlanmasını sağlayan dosya formatıdır.

Storyboard genellikle ekranları ve ekranlar arasındaki geçişleri tasarlamak için kullanılırken XIB, tek bir arayüz bileşenini bağımsız bir dosyada tanımlamak için tercih edilebilir.

Bu projede `PersonTableViewCell.xib` dosyası özel UITableViewCell tasarımı için kullanılmıştır.

XIB içerisinde:

- `UITableViewCell` oluşturulmuştur.
- Custom Class olarak `PersonTableViewCell` atanmıştır.
- Bir UIImageView ve bir UILabel eklenmiştir.
- Bu bileşenler Swift sınıfındaki IBOutlet özelliklerine bağlanmıştır.

Böylece hücrenin görünümü ile hücreye ait kod birbirinden ayrılmıştır.

### XIB ve Storyboard arasındaki fark

| XIB | Storyboard |
|---|---|
| Tekil arayüz bileşenlerini tasarlamak için uygundur. | Birden fazla ekranı ve ekran geçişlerini tasarlamak için uygundur. |
| Özel tablo hücreleri gibi tekrar kullanılabilir bileşenlerde tercih edilebilir. | Uygulamanın ekran akışını görsel olarak yönetmek için tercih edilebilir. |
| Kod içerisinden ayrıca yüklenebilir. | Genellikle storyboard üzerinden başlatılan ekranlarla kullanılır. |

---

## XIB Dosyasını Yükleme

XIB dosyasında tasarlanan hücrenin kullanılabilmesi için önce belleğe yüklenmesi gerekir.

Projede bunun için `Bundle.main.loadNibNamed` metodu kullanılmıştır.

```swift
let cell = Bundle.main.loadNibNamed(
    "PersonTableViewCell",
    owner: self,
    options: nil
)?.first as! PersonTableViewCell
```

Burada önemli olan noktalar:

- `Bundle.main`: Uygulamanın ana kaynaklarına erişir.
- `loadNibNamed`: Belirtilen isimdeki XIB dosyasını yükler.
- `"PersonTableViewCell"`: Yüklenecek XIB dosyasının adıdır.
- `.first`: XIB içerisinden yüklenen ilk nesneyi alır.
- `as! PersonTableViewCell`: Yüklenen nesneyi özel hücre sınıfına dönüştürür.

Bu örnekte XIB dosyasının doğru isimle bulunması ve içerisinde `PersonTableViewCell` sınıfına ait bir hücre tanımlanmış olması gerekir.

**Neden XIB yükleme işlemi yapıyoruz?**

Hücrenin tasarımı ana Storyboard içerisinde değil, ayrı bir XIB dosyasında tutulduğu için UITableView hücreyi kullanmadan önce bu dosyadan oluşturmalıdır.

---

## Model Verilerini Hücreye Aktarma

Kişi bilgileri `Person` model sınıfında tutulur.

```swift
class Person {
    var firstName: String
    var lastName: String
    var gender: String

    init(firstName: String, lastName: String, gender: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
    }
}
```

ViewController içerisinde bu model nesneleri `personList` dizisinde saklanır.

```swift
var personList: [Person] = []
```

Buradaki önemli nokta, UITableView'in doğrudan arayüz elemanlarından veri üretmemesi; model dizisindeki verileri kullanarak hücreleri yapılandırmasıdır.

### Hücrenin yapılandırılması

```swift
func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
) -> UITableViewCell {

    let cell = Bundle.main.loadNibNamed(
        "PersonTableViewCell",
        owner: self,
        options: nil
    )?.first as! PersonTableViewCell

    let person = personList[indexPath.row]

    cell.fullnameLabel.text = person.firstName + " " + person.lastName

    if person.gender == "M" {
        cell.genderImageView.image = .male
    } else {
        cell.genderImageView.image = .female
    }

    return cell
}
```

Bu metotta üç temel işlem gerçekleştirilir:

1. XIB dosyasından özel hücre yüklenir.
2. `indexPath.row` kullanılarak ilgili satırın Person nesnesine erişilir.
3. Modeldeki bilgiler hücrenin UILabel ve UIImageView bileşenlerine aktarılır.

`indexPath`, hücrenin tablo içerisindeki konumunu belirtir. `row` satır indeksini, `section` ise hücrenin bulunduğu bölümü ifade eder.

Bu projede tek bir bölüm bulunduğundan satır indeksine göre kişi seçmek yeterlidir.

### Asset Catalog kullanımı

Cinsiyet bilgisine göre gösterilen görseller `Assets.xcassets` içerisinde tutulmaktadır.

- `male.imageset`
- `female.imageset`

Hücre yapılandırılırken modeldeki `gender` değeri kontrol edilir ve uygun görsel UIImageView'a atanır.

Böylece aynı hücre tasarımı farklı kişilerin bilgileriyle tekrar kullanılabilir.

---

## UITableViewCell Reuse

UITableView, çok sayıda satır içeren listelerde performansı korumak için hücreleri yeniden kullanabilecek şekilde tasarlanmıştır.

Örneğin ekranda aynı anda yalnızca 8 satır görünüyorsa, yüzlerce hücreyi ayrı ayrı oluşturmak yerine ekrandan çıkan hücreler yeniden kullanılabilir.

Bunun için genellikle:

- `register(_:forCellReuseIdentifier:)`
- `dequeueReusableCell(withIdentifier:for:)`

metotları kullanılır.

Bu projede ise hücreler `Bundle.main.loadNibNamed` ile her `cellForRowAt` çağrısında yeniden yüklenmektedir.

Bu yaklaşım XIB üzerinden özel hücre oluşturmayı öğrenmek için uygundur; ancak büyük listelerde hücrelerin yeniden kullanılması daha verimli bir yöntemdir.

XIB tabanlı hücrelerde yeniden kullanım için XIB'nin tabloya kaydedilmesi ve hücrenin reuse identifier üzerinden alınması gerekir.

---

## Proje Yapısı

```text
CustomPersonTableView/
├── CustomPersonTableView.xcodeproj/
└── CustomPersonTableView/
    ├── AppDelegate.swift
    ├── SceneDelegate.swift
    ├── ViewController.swift
    ├── Person.swift
    ├── PersonTableViewCell.swift
    ├── PersonTableViewCell.xib
    ├── Assets.xcassets/
    │   ├── male.imageset/
    │   └── female.imageset/
    └── Base.lproj/
        └── Main.storyboard
```

## Kullanılan Teknolojiler

- **Swift** – Uygulamanın programlama dili.
- **UIKit** – Kullanıcı arayüzü bileşenleri.
- **UITableView** – Kişi listesinin görüntülenmesi.
- **UITableViewDataSource** – Tablo verilerinin sağlanması.
- **UITableViewDelegate** – Tablo etkileşimlerinin yönetilmesi.
- **UITableViewCell** – Özel tablo hücresi oluşturulması.
- **XIB / Interface Builder** – Hücre arayüzünün görsel olarak tasarlanması.
- **IBOutlet** – Arayüz bileşenlerinin Swift sınıfına bağlanması.
- **Asset Catalog** – Görsellerin yönetilmesi.

## Öğrenilen Konular

- UITableView'in çalışma mantığı
- UITableViewDataSource ve UITableViewDelegate
- Özel UITableViewCell oluşturma
- XIB ile arayüz tasarlama
- XIB dosyasını kod içerisinden yükleme
- IBOutlet bağlantıları
- Model verilerini tablo hücrelerine aktarma
- IndexPath kullanımı
- UITableView hücrelerinin yeniden kullanımı