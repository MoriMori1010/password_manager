#!/bin/bash
add_password(){
read -p "サービス名を入力してください！" service_name
read -p "ユーザー名を入力してください！" user_name
read -p "パスワードを入力してください！" password
echo

cat << EOF >> file.txt
サービス名: $service_name
ユーザー名: $user_name
パスワード: $password
--------------------------------

EOF

echo"パスワードの追加は成功しました。"
}
