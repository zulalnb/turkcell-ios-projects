# TableViewItemList

Swift ve UIKit kullanılarak geliştirilen basit bir liste uygulaması. Kullanıcı, metin alanına girdiği öğeleri listeye ekleyebilir ve listedeki öğeleri kaydırma hareketiyle silebilir.

Bu proje, `UITableView` kullanımını, `UITableViewDataSource` ve `UITableViewDelegate` protokollerini ve tablo görünümünün bir veri kaynağıyla nasıl çalıştığını öğrenmek amacıyla hazırlanmıştır.

## Ekran Görüntüsü

<p align="center">
  <img src="./screenshots/home.png" alt="Table View Item List uygulamasının ekranı" width="300" />
</p>

## Özellikler

- Metin alanından listeye yeni öğe ekleme
- Boş veya yalnızca boşluklardan oluşan girişleri engelleme
- Eklenen öğeleri UITableView içerisinde görüntüleme
- Hücreleri kaydırarak silme
- Bir öğe silindiğinde tablo görünümünü güncelleme

---

## UITableView Nedir?

`UITableView`, iOS uygulamalarında verileri satırlar halinde görüntülemek için kullanılan UIKit bileşenidir.

Örneğin yapılacaklar listesi, ayarlar ekranı, kişiler listesi veya mesaj kutusu gibi birçok arayüzde kullanılabilir.

UITableView, verileri doğrudan kendi içerisinde saklamaz. Bunun yerine verilerin nereden alınacağını ve hücrelerin nasıl oluşturulacağını belirlemek için veri kaynağına ihtiyaç duyar.

Bu görev, genellikle `UITableViewDataSource` protokolü aracılığıyla gerçekleştirilir.

Kullanıcı etkileşimlerini yönetmek için ise `UITableViewDelegate` protokolü kullanılır.

### UITableView Nasıl Çalışır?

Bir UITableView'in temel çalışma mantığı şu şekildedir:

1. Uygulama, gösterilecek verileri bir veri kaynağında saklar.
2. UITableView, kaç satır göstereceğini veri kaynağına sorar.
3. Her satır için ilgili hücreyi ister.
4. Veri kaynağı, hücrenin içeriğini ilgili veriye göre hazırlar.
5. Veriler değiştiğinde tablo görünümü yeniden yüklenerek güncellenir.

Bu projede veri kaynağı olarak `[String]` türünde bir dizi kullanılmıştır.

```swift
var list: [String] = []
```

Dizinin her elemanı tablodaki bir satırı temsil eder.

Örneğin:

```swift
list = [
    "Swift öğren",
    "UIKit konularını çalış",
    "UITableView pratiği yap"
]
```

Bu durumda UITableView üç satır görüntüler.

---

## UITableViewDataSource

`UITableViewDataSource`, tablo görünümünün hangi verileri ve kaç satır göstereceğini belirleyen protokoldür.

Bu protokol sayesinde UITableView, görüntüleyeceği verileri uygulamadan talep eder.

Projede `ViewController`, bu protokolü uygulamaktadır:

```swift
class ViewController: UIViewController,
                      UITableViewDataSource,
                      UITableViewDelegate {
}
```

### 1. numberOfRowsInSection

```swift
func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
) -> Int {
    return list.count
}
```

Bu metot, ilgili section içerisinde kaç satır bulunacağını belirtir.

- `tableView`: Metodun çağrıldığı tablo görünümünü temsil eder.
- `section`: Satırların ait olduğu bölümün indeksidir.
- `return`: Gösterilecek satır sayısını döndürür.

Bu projede yalnızca bir liste bölümü bulunduğundan, satır sayısı doğrudan `list.count` üzerinden hesaplanır.

Örneğin dizide 5 öğe varsa UITableView 5 satır oluşturulmasını ister.

**Neden kullanılır?**

UITableView'in kaç satır görüntülemesi gerektiğini bilmesi gerekir. Veri sayısı değişebileceği için bu değeri sabit vermek yerine veri kaynağındaki eleman sayısından hesaplamak daha doğrudur.

### 2. cellForRowAt

```swift
func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
) -> UITableViewCell {
    let cell = UITableViewCell()

    cell.textLabel?.text = list[indexPath.row]

    return cell
}
```

Bu metot, tabloda gösterilecek her satırın hücresini hazırlar.

- `tableView`: Hücrenin kullanılacağı tablo görünümüdür.
- `indexPath`: Hücrenin hangi konumda bulunduğunu belirtir.
- `indexPath.row`: Hücrenin satır indeksini verir.
- `UITableViewCell`: Tablodaki tek bir satırı temsil eden hücre nesnesidir.

Bu örnekte yeni bir `UITableViewCell` oluşturulur ve ilgili dizinin elemanı hücrenin `textLabel` özelliğine atanır.

`textLabel`, standart UITableViewCell üzerinde bulunan hazır metin alanıdır.

**Neden kullanılır?**

UITableView yalnızca satır sayısını bilmekle yetinmez. Her satırda hangi içeriğin gösterileceğini de bilmelidir. `cellForRowAt` bu görevi yerine getirir.

**IndexPath nedir?**

`IndexPath`, bir öğenin tablo görünümü içerisindeki konumunu tanımlar.

Özellikle iki özelliği önemlidir:

- `section`: Öğenin bulunduğu bölüm.
- `row`: Öğenin bulunduğu satır.

Bu projede yalnızca bir section bulunduğu için `indexPath.row` kullanmak yeterlidir.

---

## UITableViewDelegate

`UITableViewDelegate`, tablo görünümündeki kullanıcı etkileşimlerini ve bazı görsel davranışları yönetmek için kullanılan protokoldür.

Örneğin bir satıra dokunulması, satır yüksekliğinin belirlenmesi veya satırların düzenlenmesi gibi işlemler delegate üzerinden yönetilebilir.

Bu projede satır silme işlemi için UITableViewDataSource protokolünün sağladığı düzenleme metodu kullanılmıştır. `UITableViewDelegate` ise ViewController tarafından uygulanmış olsa da projede ayrıca bir delegate metodu yazılmamıştır.

### UITableViewDataSource ile Delegate Arasındaki Fark

| UITableViewDataSource | UITableViewDelegate |
|---|---|
| Verilerin nasıl gösterileceğini belirler. | Kullanıcı etkileşimlerini ve görünüm davranışlarını yönetir. |
| Satır sayısını bildirir. | Satır seçimi gibi etkileşimleri yönetir. |
| Hücreleri hazırlar. | Hücre yüksekliği gibi görsel ayarları yapabilir. |

İkisi farklı sorumluluklara sahiptir ancak aynı ViewController tarafından uygulanabilir.

---

## UITableView Bağlantıları

Storyboard üzerinde oluşturulan UITableView'in veri kaynağı ve delegate bağlantıları ViewController'a atanmıştır.

```swift
@IBOutlet weak var tvList: UITableView!
```

Bu outlet sayesinde kod içerisinden tablo görünümüne erişilebilir.

Storyboard'da:

- `dataSource`, ViewController'a bağlanmıştır.
- `delegate`, ViewController'a bağlanmıştır.

Bu bağlantılar önemlidir. Çünkü UITableView, hangi nesneden veri isteyeceğini ve etkileşimleri hangi nesnenin yöneteceğini bu bağlantılar üzerinden öğrenir.

---

## Listeye Yeni Öğe Ekleme

Storyboard üzerinde bir UITextField ve UIButton bulunmaktadır.

Kullanıcı metin alanına bir değer girerek Ekle butonuna bastığında aşağıdaki IBAction metodu çalışır.

```swift
@IBAction func btnAdd_TUI(_ sender: Any) {
    let item = tfItem.text?
        .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

    guard !item.isEmpty else {
        return
    }

    list.append(item)
    tvList.reloadData()

    tfItem.text = ""
}
```

İşlem adımları:

**1. Kullanıcı girişini alma**

```swift
let item = tfItem.text?
    .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
```

UITextField içerisindeki metin alınır.

`trimmingCharacters(in:)`, metnin başındaki ve sonundaki boşlukları ve satır sonu karakterlerini temizler.

`?? ""` ise `text` değeri nil olduğunda boş String kullanılmasını sağlar.

**2. Boş giriş kontrolü**

```swift
guard !item.isEmpty else {
    return
}
```

Kullanıcının boş veya yalnızca boşluklardan oluşan bir değer eklemesi engellenir.

`guard`, koşul sağlanmadığında metottan erken çıkmayı sağlar.

**3. Veriyi diziye ekleme**

```swift
list.append(item)
```

Yeni öğe listenin sonuna eklenir.

**4. Tabloyu güncelleme**

```swift
tvList.reloadData()
```

UITableView'in veri kaynağındaki güncel verileri yeniden okuması sağlanır.

`reloadData()`, satır sayısı ve hücre içerikleri dahil tablo görünümünün yeniden yüklenmesini sağlar.

Bu metot çağrıldığında UITableView tekrar `numberOfRowsInSection` ve gerekli hücreler için `cellForRowAt` metotlarını çağırır.

**5. Metin alanını temizleme**

```swift
tfItem.text = ""
```

Öğe eklendikten sonra kullanıcı yeni bir değer girebilsin diye metin alanı temizlenir.

---

## UITableView Üzerinden Öğe Silme

UITableView, varsayılan olarak satırların kaydırılarak silinmesini destekler.

Bu projede silme işlemi için aşağıdaki metot kullanılmıştır:

```swift
func tableView(
    _ tableView: UITableView,
    commit editingStyle: UITableViewCell.EditingStyle,
    forRowAt indexPath: IndexPath
) {
    if editingStyle == .delete {
        list.remove(at: indexPath.row)
        tvList.reloadData()
    }
}
```

Bu metot, UITableView hücreleri üzerinde düzenleme işlemi gerçekleştirildiğinde çağrılır.

**editingStyle nedir?**

`UITableViewCell.EditingStyle`, hücre üzerinde gerçekleştirilen düzenleme işleminin türünü belirtir.

Başlıca değerleri:

- `.delete`: Silme işlemi.
- `.insert`: Ekleme işlemi.

Bu projede yalnızca `.delete` kontrol edilmektedir.

**indexPath.row neden kullanılır?**

Kullanıcı hangi satırı kaydırarak silerse, o satırın indeksi `indexPath.row` üzerinden alınır.

```swift
list.remove(at: indexPath.row)
```

İlgili eleman diziden kaldırılır.

Ardından:

```swift
tvList.reloadData()
```

çağrılarak tablo görünümü güncel listeye göre yeniden oluşturulur.

**Neden önce diziden siliyoruz?**

UITableView yalnızca verileri görüntüler. Verilerin asıl kaynağı `list` dizisidir.

Bu nedenle bir hücre silindiğinde önce ilgili veri diziden kaldırılmalıdır. Aksi takdirde tablo yeniden yüklendiğinde aynı öğe tekrar görüntülenebilir.

---

## reloadData() Nedir?

`reloadData()`, UITableView'in mevcut verileri yeniden okuyarak görünümünü güncellemesini sağlar.

Bu projede iki yerde kullanılmıştır:

- Yeni öğe eklendiğinde.
- Bir öğe silindiğinde.

Örneğin listeye yeni bir String eklendiğinde UITableView bunu otomatik olarak algılamaz. `reloadData()` çağrısı ile tabloya verilerin değiştiği bildirilir.

Daha gelişmiş uygulamalarda yalnızca değişen satırları güncellemek için `insertRows(at:with:)` ve `deleteRows(at:with:)` gibi metotlar da kullanılabilir.

---

## Proje Yapısı

```text
TableViewItemList/
├── TableViewItemList.xcodeproj/
└── TableViewItemList/
    ├── AppDelegate.swift
    ├── SceneDelegate.swift
    ├── ViewController.swift
    ├── Assets.xcassets/
    └── Base.lproj/
        └── Main.storyboard
```

## Kullanılan Teknolojiler

- **Swift** – Uygulamanın programlama dili.
- **UIKit** – Kullanıcı arayüzünün oluşturulması.
- **UITableView** – Liste verilerinin satırlar halinde görüntülenmesi.
- **UITableViewDataSource** – Tabloya veri sağlanması.
- **UITableViewDelegate** – Tablo etkileşimlerinin yönetilmesi.
- **Storyboard** – Arayüz elemanlarının görsel olarak oluşturulması.
- **IBOutlet / IBAction** – Storyboard ile Swift kodu arasındaki bağlantılar.

## Öğrenilen Konular

Bu proje ile aşağıdaki konular üzerinde pratik yapılmıştır:

- UITableView'in temel çalışma mantığı
- UITableViewDataSource ve UITableViewDelegate protokolleri
- `numberOfRowsInSection` ve `cellForRowAt` metotları
- IndexPath ve row kavramları
- UITableViewCell kullanımı
- `reloadData()` ile tabloyu güncelleme
- Hücre kaydırarak silme
- UITextField üzerinden veri alma
- Diziye eleman ekleme ve silme
- Optional değerler ve nil kontrolü
- `guard` ile giriş doğrulama
- IBOutlet ve IBAction bağlantıları

## Notlar

Bu uygulamada liste verileri yalnızca çalışma zamanında bellekte tutulan `[String]` dizisinde saklanmaktadır. Uygulama kapatıldığında eklenen öğeler kalıcı olarak korunmaz.

Ayrıca hücreler `dequeueReusableCell` yerine doğrudan `UITableViewCell()` oluşturularak hazırlanmıştır. Bu yöntem temel bir alıştırma için yeterlidir. Daha büyük listelerde hücreleri yeniden kullanmak performans ve bellek yönetimi açısından daha doğru bir yaklaşımdır.