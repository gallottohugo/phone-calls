#!/usr/bin/env ruby	
system('bundle install')
system('rails webpacker:install')
system('rails db:migrate')
system('rails db:seed')
system('rails s')
