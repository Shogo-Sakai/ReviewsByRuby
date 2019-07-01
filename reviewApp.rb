# レビューを書く
def post_review(a_posts)
  # 変数の定義
  post = {}
  puts "ジャンルを入力してください。"
  post[:genre] = gets.chomp
  puts "タイトルを入力してください。"
  post[:title] = gets.chomp
  puts "おすすめ度（☆の数１〜５）は？"
  post[:recommend] = gets.to_i
  puts "感想を入力してください。"
  post[:review] = gets.chomp
  line ="------------------------------" 

  # 出力
  puts "#{line}\nジャンル： #{post[:genre]}\n#{line}"
  puts "タイトル： #{post[:title]}\n#{line}"
  puts "おすすめ度:\t#{post[:recommend]}\n#{line}"
  puts "感想:\n\t#{post[:review]}\n#{line}"

# 配列オブジェクトに追加
  a_posts << post
# 配列オブジェクトを返す
  return a_posts
end

# レビューを読む
def read_reviews(a_posts)
  # リストを表示する
  n = 0
  a_posts.each do |b_post|
    b_post = a_posts[n]
    puts "[#{n}]:#{b_post[:title]}のレビュー"
    n += 1
  end


  puts "\n見たいレビューの番号を入力してください："
  # 番号を取得する
  input = gets.to_i
  # 配列を取得する
  post = a_posts[input]
  line ="------------------------------" 
  if post then
    puts "ジャンル： #{post[:genre]}\n#{line}"
    puts "タイトル： #{post[:title]}\n#{line}"
    puts "おすすめ度:#{post[:recommend]}\n#{line}"
    puts "感想:\n\t#{post[:review]}\n#{line}"
  else
    puts "#{line}\n表示されているレビューの番号を入力してください。"
  end
end

# アプリを終了する
def end_program
  exit
end

# それ意外
def exception
  puts "入力された値は無効です。"
end

posts = []

while true do
  # メニュー
  puts "レビュー数:#{posts.length}"
  puts "[0]レビューを書く"
  # レビューが無い時は表示を消す。
  if posts != [] then
  puts "[1]レビューを読む"
  end
  puts "[2]アプリを終了する"
  input = gets.to_i

  if input == 0
    posts = post_review(posts)
  elsif input == 1
    read_reviews(posts)  
  elsif input == 2
    end_program
  else
    exception
  end
end