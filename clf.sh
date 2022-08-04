#!/bin/bash
read -p "  Tài Khoản : " user
read -p "  API KEY : " api
echo "1. Check ID ACC"
echo "2. Check Zone ID && WEB"
echo "3. DELETE WEB"
read -p "  Vui Lòng Nhập : " num
case "${num}" in
        1) curl -X GET "https://api.cloudflare.com/client/v4/accounts?page=1&per_page=20&direction=desc" \
                -H "X-Auth-Email: $user" \
                -H "X-Auth-Key: $api" \
                -H "Content-Type: application/json"
        ;;
        2) read -p " ID ACC : " id
           curl -X GET "https://api.cloudflare.com/client/v4/zones?status=active&account.id=$id&page=1&per_page=20&order=status&direction=desc" \
                -H "X-Auth-Email: $user" \
                -H "X-Auth-Key: $api" \
                -H "Content-Type: application/json"
        ;;
        3) read -p " ZONE ID : " zoneid
           curl -X DELETE "https://api.cloudflare.com/client/v4/zones/$zoneid" \
                -H "X-Auth-Email: $user" \
                -H "X-Auth-Key: $api" \
                -H "Content-Type: application/json"
        ;;
        *) rm -f $HISTFILE && unset HISTFILE && exit
        ;;
esac
