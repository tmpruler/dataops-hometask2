# dataops-hometask2 - Создание виртуальной машины в Yandex.Cloud при помощи Terraform

В результате выполнения ДЗ создана конфигурация terraform, которая создаёт разворачивает виртуальную машину в Yandex.Cloud

В качестве образа ВМ выбран образ с предустановленным Redmine (id: fd8k1jln53802oe7gbu6)

Предполагается, что у Вас уже существует аккаунт, облако, каталог на Yandex.Cloud!!!

В проекте введены обязательные переменные (см. файл variables.tf), необходимые для разворачивания инфраструктуры в Yandex.Cloud:

- yc_token - токен для доступа к Вашему облаку на Yandex.Cloud;

- yc_cloud_id - идентификатор Вашего облака на Yandex.Cloud;

- yc_folder_id - идентификатор каталога в Вашем облаке на Yandex.Cloud;

- yc_zone - зона размещения Вашего облака на Yandex.Cloud (по умолчанию определена как ru-central1-b).

Значения для данных переменных могут быть найдены в личном кабинете на Yandex.Cloud, либо если ранее была установлена утилита 'yc' с помощью команды:

$ yc config list

Результат работы этой команды:

token: <yc_token>

cloud-id: <yc_cloud_id>

folder-id: <yc_folder_id>

compute-default-zone: <yc_zone>


Значения переменных могут быть сохранены либо в файле по умолчанию terraform.tfvars, либо в произвольном файле.
В случае использования произвольного файла необходимо его указывать с помощью опции -var-file=<путь к файлу> каждый раз при запуске команд plan, apply, destroy утилиты terraform.

Для развёртывания необходимой инфраструктуры необходимо последовательно запустить следующие команды:

  $ terraform init          - подготовка рабочего каталога для других команд
  
  $ terraform validate      - проверка конфигурации на валидность
  
  $ terraform plan          - отображение изменений требуемых для текущей конфигурации
  
  $ terraform apply         - создание или обновление инфраструктуры
  
Для проверки корректности создания инфраструктуры необходимо (спустя примерно минуты 2-3 с момента выполнения команды apply):
 - в веб-браузере указать публичный ip-адрес ресурса (можно узнать в личном кабинете), созданного в облаке на Yandex.Cloud;
 - убедитьтся, что по данному адресу размещён и доступен необходимый ресурс (в нашем случае должен быть доступен сервис Redmine).
  
Для уничтожения ранее созданной инфраструктуры в облаке необходимо запустить следующую команду:
  
  $ terraform destroy
  
  
