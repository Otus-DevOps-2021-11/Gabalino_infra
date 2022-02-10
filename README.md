# Gabalino_infra
Gabalino Infra repository

__ДЗ 3: Запуск VM в Yandex Cloud, управление правилами фаервола, настройка SSH подключения, настройка SSH подключения через Bastion Host, настройка VPN сервера и VPN-подключения__

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

__ДЗ 4: Практика управления ресурсамиyandex cloud через yc__

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

__ДЗ 5: Подготовка базового образа VM при помощи Packer__

Установить Packer
https://packer.io/downloads.html

Посмотреть folder-id
```shell
yc config list
```
Создайть сервисный аккаунт
```shell
SVC_ACCT="<придумайте имя>"
FOLDER_ID="<замените на собственный>"
yc iam service-account create --name $SVC_ACCT --folder-id $FOLDER_ID
```
Назначить роль editor
```shell
ACCT_ID=$(yc iam service-account get $SVC_ACCT | \
   grep ^id | \
   awk '{print $2}')

yc resource-manager folder add-access-binding --id $FOLDER_ID \
   --role editor \
   --service-account-id $ACCT_ID
```
Создание service account key file
```shell
yc iam key create --service-account-id $ACCT_ID --output <вставьте свой путь>/key.json
```
Проверка шаблона
```shell
packer validate ./ubuntu16.json
```
Сборка
```shell
packer build --var-file=variables.json ./ubuntu16.json
```
Собрать образ и запустить VM
```shell
cd packer && \
./scripts/build-reddit-image.sh && \
../config-scripts/create-reddit-vm.sh
```
```shell
pip install virtualenv
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
deactivate
```
```shell
pip install -r requirements.txt
cd app
molecule init scenario --scenario-name default -r app -d vagrant #create template
molecule/default/tests/test_default.py #add tests
molecule/default/molecule.yml #vm properties
molecule create
molecule list
molecule login -h instance #ssh
molecule/default/playbook.yml #edit playbook
molecule converge #run playbook
molecule verify #run test
```
