### Check Ruby & Rails versions

```shell
$ruby -v
> ruby 3.0.1

$rails -v
> Rails 6.1.3.2
```


## Install

### 1. clone the repository
```shell
git clone https://github.com/gallottohugo/phone-calls.git
cd phone-calls
```

### 2. install dependencies
```shell
bundle && yarn
```

### 3. initialize the database
```shell
rails db:create db:migrate db:seed
```

### 4. run server
```shell
rails s
```

### Comments
