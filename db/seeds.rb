# adminサンプルユーザーを1人作成する
User.create(name: "example", password: "password", password_confirmation: "password", admin: true)

# ゲストユーザーを作成
User.create(name: "gest", password: "gest", password_confirmation: "gest")