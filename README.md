<p align="center">
  <a href="https://codemagic.io/apps/637c6470178409ed091beb2e/637c6470178409ed091beb2d/latest_build"></a><img src="https://api.codemagic.io/apps/637c6470178409ed091beb2e/637c6470178409ed091beb2d/status_badge.svg" alt="Codemagic build status"></a>
</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/68180390/204479494-770ed282-aef0-4e4e-802c-4fc3064c6852.png" alt="Codemagic build" />
  </br>
</p>

![Analytics 1 - Andrea Nataya Bantoro](https://user-images.githubusercontent.com/68180390/204479823-d8131dc8-32c1-4df1-9a48-7614e1c4284c.png)

![Analytics 2 - Andrea Nataya Bantoro](https://user-images.githubusercontent.com/68180390/204479897-bbb615a9-2250-4a52-acf3-72baa34f61dc.png)

![Crashlytics - Andrea Nataya Bantoro](https://user-images.githubusercontent.com/68180390/204479997-b9319d3e-850c-4a11-9ce3-1b0feab46c47.png)

# a199-flutter-expert-project

Repository ini merupakan starter project submission kelas Flutter Expert Dicoding Indonesia.

---

## Tips Submission Awal

Pastikan untuk memeriksa kembali seluruh hasil testing pada submissionmu sebelum dikirimkan. Karena kriteria pada submission ini akan diperiksa setelah seluruh berkas testing berhasil dijalankan.


## Tips Submission Akhir

Jika kamu menerapkan modular pada project, Anda dapat memanfaatkan berkas `test.sh` pada repository ini. Berkas tersebut dapat mempermudah proses testing melalui *terminal* atau *command prompt*. Sebelumnya menjalankan berkas tersebut, ikuti beberapa langkah berikut:
1. Install terlebih dahulu aplikasi sesuai dengan Operating System (OS) yang Anda gunakan.
    - Bagi pengguna **Linux**, jalankan perintah berikut pada terminal.
        ```
        sudo apt-get update -qq -y
        sudo apt-get install lcov -y
        ```
    
    - Bagi pengguna **Mac**, jalankan perintah berikut pada terminal.
        ```
        brew install lcov
        ```
    - Bagi pengguna **Windows**, ikuti langkah berikut.
        - Install [Chocolatey](https://chocolatey.org/install) pada komputermu.
        - Setelah berhasil, install [lcov](https://community.chocolatey.org/packages/lcov) dengan menjalankan perintah berikut.
            ```
            choco install lcov
            ```
        - Kemudian cek **Environtment Variabel** pada kolom **System variabels** terdapat variabel GENTHTML dan LCOV_HOME. Jika tidak tersedia, Anda bisa menambahkan variabel baru dengan nilai seperti berikut.
            | Variable | Value|
            | ----------- | ----------- |
            | GENTHTML | C:\ProgramData\chocolatey\lib\lcov\tools\bin\genhtml |
            | LCOV_HOME | C:\ProgramData\chocolatey\lib\lcov\tools |
        
2. Untuk mempermudah proses verifikasi testing, jalankan perintah berikut.
    ```
    git init
    ```
3. Kemudian jalankan berkas `test.sh` dengan perintah berikut pada *terminal* atau *powershell*.
    ```
    test.sh
    ```
    atau
    ```
    ./test.sh
    ```
    Proses ini akan men-*generate* berkas `lcov.info` dan folder `coverage` terkait dengan laporan coverage.
4. Tunggu proses testing selesai hingga muncul web terkait laporan coverage.

