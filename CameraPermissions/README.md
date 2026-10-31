# Camera Permissions

Bu uygulama, iOS uygulamalarında kamera erişim izinlerinin kontrol edilmesini ve kamera üzerinden çekilen bir görselin uygulama arayüzünde görüntülenmesini göstermek amacıyla hazırlanmıştır.

Uygulama, UIKit ve AVFoundation framework'leri kullanılarak geliştirilmiştir.

## Konu: Camera Permissions

iOS uygulamalarının kamera, mikrofon ve konum gibi cihaz kaynaklarına erişebilmesi için kullanıcıdan izin alması gerekir.

Bu izinler, kullanıcı gizliliğini korumak amacıyla işletim sistemi tarafından yönetilir. Uygulama, ilgili kaynağa erişmeden önce mevcut izin durumunu kontrol etmeli ve gerekli durumlarda kullanıcıdan izin istemelidir.

### AVCaptureDevice ve Authorization Status

AVFoundation framework'ü içerisinde bulunan `AVCaptureDevice`, kamera ve mikrofon gibi medya yakalama cihazlarına erişim ve bu cihazların yetkilendirme durumlarını kontrol etmek için kullanılır.

```swift
let status = AVCaptureDevice.authorizationStatus(for: .video)
```

`authorizationStatus(for:)` metodu, belirtilen medya türü için uygulamanın mevcut izin durumunu döndürür.

Kamera erişimi için `.video` medya türü kullanılır.

Dört temel izin durumu bulunur:

| Status | Açıklama |
| --- | --- |
| `.notDetermined` | Kullanıcı henüz izin isteğine yanıt vermemiştir. |
| `.restricted` | Sistem kısıtlamaları nedeniyle kamera erişimi mümkün değildir. |
| `.denied` | Kullanıcı kamera erişimini reddetmiştir. |
| `.authorized` | Kullanıcı kamera erişimine izin vermiştir. |

### İzin Durumuna Göre İşlem Yapılması

İzin durumuna göre uygulamanın farklı davranışlar sergilemesi gerekir.

- **notDetermined:** Kullanıcı henüz karar vermemiştir. Kamera erişimi başlatıldığında sistem izin isteğini gösterebilir.
- **restricted:** Kamera erişimi sistem tarafından kısıtlanmıştır.
- **denied:** Kullanıcı daha önce kamera erişimini reddetmiştir. Kullanıcıya uygulama ayarlarından izni açabileceği bildirilir.
- **authorized:** Kamera erişimine izin verilmiştir ve kamera arayüzü açılabilir.

İzin durumlarını kontrol etmek için `switch` yapısı kullanılabilir.

### NSCameraUsageDescription

iOS uygulamalarının kamera erişimi için `Info.plist` dosyasında `NSCameraUsageDescription` anahtarının tanımlanması gerekir.

Bu anahtar, sistemin kullanıcıya göstereceği kamera erişim açıklamasını içerir.

Örnek:

```xml
<key>NSCameraUsageDescription</key>
<string>Kamera erişimine izin vermelisiniz</string>
```

Bu açıklama, sistemin kamera erişimi için izin istediği sırada kullanıcıya gösterilir.

### UIImagePickerController

UIKit içerisinde bulunan `UIImagePickerController`, cihazın kamerasını kullanarak fotoğraf çekmek veya medya kütüphanesinden görsel seçmek için kullanılan sistem arayüzüdür.

Kamera üzerinden fotoğraf çekmek için `sourceType` özelliği `.camera` olarak ayarlanır.

```swift
let imagePicker = UIImagePickerController()
imagePicker.delegate = self
imagePicker.sourceType = .camera

present(imagePicker, animated: true)
```

`UIImagePickerControllerDelegate` protokolü, kullanıcının seçtiği veya çektiği görselin uygulamaya aktarılmasını sağlar.

Fotoğraf çekildiğinde `imagePickerController(_:didFinishPickingMediaWithInfo:)` metodu çağrılır.

```swift
func imagePickerController(
    _ picker: UIImagePickerController,
    didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
) {
    let image = info[.originalImage] as! UIImage
    backgroundImageView.image = image

    dismiss(animated: true)
}
```

Bu örnekte çekilen fotoğraf, `UIImageView` bileşeninin görseli olarak atanır.

### Uygulama Ayarlarına Yönlendirme

Kullanıcı kamera erişimini reddettiğinde uygulama, sistem izin penceresini doğrudan tekrar gösteremez.

Bu durumda kullanıcı bilgilendirilebilir ve uygulama ayarlarına yönlendirilebilir.

`UIApplication.openSettingsURLString`, uygulamanın kendi ayarlar sayfasına erişmek için kullanılan URL değeridir.

```swift
guard let settingsURL = URL(
    string: UIApplication.openSettingsURLString
) else { return }

UIApplication.shared.open(settingsURL)
```

Kullanıcı ayarlar ekranından kamera erişimini yeniden etkinleştirebilir.

## Uygulamanın Çalışma Akışı

1. Kullanıcı **Kamera Aç** butonuna basar.
2. Uygulama, `AVCaptureDevice.authorizationStatus(for: .video)` ile kamera izin durumunu kontrol eder.
3. İzin durumuna göre kamera erişimi başlatılır veya kullanıcı bilgilendirilir.
4. Kamera erişimi reddedilmişse kullanıcıya Ayarlar seçeneği sunulur.
5. Kullanıcı fotoğraf çektiğinde görsel `UIImagePickerControllerDelegate` üzerinden alınır.
6. Çekilen fotoğraf, ekrandaki `UIImageView` bileşenine atanır.

## Kullanılan Teknolojiler

- Swift
- UIKit
- AVFoundation
- UIImagePickerController
- Xcode
- Interface Builder (Storyboard)

## Öğrenilenler

- iOS gizlilik ve izin yönetimi
- AVCaptureDevice ile kamera izin durumlarını kontrol etme
- AVAuthorizationStatus değerleri
- Info.plist içerisinde kullanım açıklaması tanımlama
- UIImagePickerController ile kamera erişimi
- UIImagePickerControllerDelegate kullanımı
- UIApplication üzerinden uygulama ayarlarına yönlendirme
- Kameradan alınan görseli UIImageView içerisinde görüntüleme