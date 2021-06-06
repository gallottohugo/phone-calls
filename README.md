## Check Ruby & Rails versions

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

## Solution
### Subscription
- Subscription get from the user
### Local calls
- The days were divided into three intervals to identify the diferents prices.
- It identifies in which interval the call begins and which it ends.
- Loop the intervals in relation to the duration of the call.
- Sum (minutes * price) with their respective price.
### National calls
- Sum (minutes * prices). Price is get from the receiver user city.
### International calls
- Sum (minutes * prices). Price is get from the receiver user country.
### Bill total cost
- Sum (subscription + local calls + national calls + international calls)
### View solution
- In localhost you can check current year bills of user 1


## Comments

- Can check Entity–relationship model into ER_model.pdf
- Calls that start in one month and end in another belong to the starting month
