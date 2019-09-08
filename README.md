# ArticleWebApi

ASP.NET Core Web API kullanılarak geliştirilmiş örnek bir makale api uygulamasıdır.

IDE olarak Visual Studio Community 2019 (16.2.3) kullanılmıştır.

## Kullanılan Teknolojiler

- .Net Core Framework
- ASP.NET Web API
- MSSQL
- Dapper ORM

## Soru ve Cevaplar

Projede kullanıdığınız tasarım desenleri hangileridir? Bu desenleri neden kullandınız?
  +Dapper ile generic repository pattern kullanılmış ve kod tekrarının önüne geçilmiştir.

- Kullandığınız teknoloji ve kütüphaneler hakkında daha önce tecrübeniz oldu mu? Tek tek
yazabilir misiniz?
+ .Net Core ile daha önceden çalışmalarım bulunuyordu.
+ Çalışmış olduğum tüm projelerimde MSSQL veritabanı aktif kullandım ve veritabanı şemaları oluşturdum.
+ Dapper ORM'i daha önce bir projede kullanmış ve test etmiştim. Boyutu küçük ve kolay uygulanabilir olması yönünden bu projede tercih ettim.

- Daha geniş vaktiniz olsaydı projeye neler eklemek isterdiniz?
+ Örneğin Business katmanı ekleyip bazı işlemler oraya taşınabilirdi.
+ Örnekleri çoğaltıp gerçeğe daha yakın bir bir db şeması ve yeni methodlar eklenebilirdi.
+ Servisin güvenliğini sağlamak adı autontication methodları eklenebilirdi. Bunun için genellikle JWT (JSON Web Tokens) kullanmaktayım.
+ Projeye ihtiyac olan filterlar eklenebilirdi.
+ Sql Query'ler bir Constants dosyasına eklenip kod içinden temizlenebilirdi.

- Eklemek istediğiniz bir yorumunuz var mı?
+ Geliştirmeler yaparken uzun bir zaman ayıramadım. Hata ve eksikler var ise affola :)
