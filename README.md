# Gabalino_infra
Gabalino Infra repository

ДЗ 3: Запуск VM в Yandex Cloud, управление правилами фаервола, настройка SSH подключения, настройка SSH подключения через Bastion Host, настройка VPN сервера и VPN-подключения.

bastion_IP = 62.84.113.202
someinternalhost_IP = 10.128.0.33

Подключение по SSH к someinternalhost через bastion.
```shell
ssh -i ~/.ssh/appuser -J appuser@bastion_IP someinternalhost_IP
```
или добавить в файл ~/.ssh/config
```shell
Host bastion
   HostName     bastion_IP
   User         appuser
   IdentityFile ~/.ssh/appuser

Host someinternalhost
   HostName     someinternalhost_IP
   User         appuser
   IdentityFile ~/.ssh/appuser
   ProxyJump bastion
```
Теперь подключиться можно командой ssh someinternalhost

Установка VPN сервера Pritunl
```shell
sudo setupvpn.sh
```
Получение ключа для настройки
```shell
sudo pritunl setup-key
```
Открытие web интерфейса
https://<адрес bastion VM>/setup

Получение пароля
```shell
sudo pritunl default-password
```

Затем создать сервер с DNS именем, организацию и пользователя. Получить SSL сертификат. Связать сервер с организацией. Создать пользователя и сохранить файл с настройками для подключения.

ДЗ 4: Практика управления ресурсамиyandex cloud через yc.

testapp_IP = 51.250.2.236
testapp_port = 9292

Установка yc
```shell
curl https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash
```
Создание профиля
```shell
yc init
```
Просмотр профиля
```shell
yc config profile get <имя профиля>
```
