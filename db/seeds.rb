# adminサンプルユーザーを1人作成する
User.create(name: "admin", password: "password", password_confirmation: "password", admin: true)

# ゲストユーザーを作成
User.create(name: "guest", password: "guest", password_confirmation: "guest")