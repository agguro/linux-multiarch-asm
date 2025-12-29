#!/usr/bin/expect -f
set timeout -1
spawn ./logic
set pid [exp_pid]
set sec [exec date +%s]
expect "enter password:"
send "$pid$sec\n"
expect "password"
puts "password = $pid$sec"
close
