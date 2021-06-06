### Check your Ruby version

```shell
$ruby -v
> ruby 3.0.1

$rails -v
> Rails 6.1.3.2

```


## INSTALL

### Clone the repository
```shell
git clone https://github.com/gallottohugo/phone-calls.git
cd phone-calls
```

### Install dependencies
```shell
bundle && yarn
```

### Initialize the database
```shell
rails db:create db:migrate db:seed
```

## Run server
```shell
rails s
```
