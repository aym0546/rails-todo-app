# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Creating test users...'
user1 = User.create!(email: 'user1@example.com', password: 'password')
user2 = User.create!(email: 'user2@example.com', password: 'password')

puts 'Creating profiles...'
Profile.create!(user: user1, nickname: 'Alice')
Profile.create!(user: user2, nickname: 'Bob')

puts 'Creating boards...'
board1 = Board.create!(user: user1, title: 'Marketing', description: 'マーケティングに関するタスク')
board2 = Board.create!(user: user2, title: 'HR', description: '人事関連のタスク')

puts 'Creating tasks...'
task1 = Task.create!(user: user1, board: board1, title: 'SNS戦略の立案', content: 'Twitterのプロモーション戦略を検討する', deadline: Date.today + 7)
task2 = Task.create!(user: user2, board: board2, title: '求人票の更新', content: 'Wantedlyに新しい求人を掲載する', deadline: Date.today + 5)

puts 'Creating comments...'
Comment.create!(user: user2, task: task1, content: 'いい案だと思います！')
Comment.create!(user: user1, task: task2, content: 'フォーマットを統一しましょう')

puts 'Seeding completed.'