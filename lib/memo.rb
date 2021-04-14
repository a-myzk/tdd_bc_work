# ここは完全にメモ


# ...ステップ0...
# 初期設定（自動販売機インスタンスを作成して、vmという変数に代入する）
# vm = VendingMachine.new
# 作成した自動販売機に100円を入れる
# vm.slot_money (100)
# 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
# vm.current_slot_money
# 作成した自動販売機に入れたお金を返してもらう
# vm.return_money

# class Drink

#   attr_reader :name, :price

#   def initialaze(name, price)
#     @name = name
#     @price = price
#   end

#   def self.cola

#   end
# end

class VendingMachine

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0

    # 初期状態でコーラ5本格納
    @name = 'コーラ'
    @price = 120
    @store_drink = [
      {name: @name, price: @price},
      {name: @name, price: @price},
      {name: @name, price: @price},
      {name: @name, price: @price},
      {name: @name, price: @price},
    ]

    # 在庫数
    @stock = @store_drink.length
  end

  def store_drink
    # 格納されているジュースの情報（値段と名前と在庫）を取得できる。
    puts "#{@name}:#{@price}円:#{@stock}本"
  end

  # 投入金額の総計を取得できる。
  def current_slot_money
    # 自動販売機に入っているお金を表示する
    puts "#{@slot_money}円入っています。"
  end

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  def slot_money(money)
    if MONEY.include?(money)
      # 投入金額の総計を取得できる
      puts "投入金額の合計は#{@slot_money += money}円です。"
    else
      # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
      # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
      puts "#{money}円は使用できません。"
    end
  end

  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    # 返すお金の金額を表示する
    puts "お釣りは#{@slot_money}円です。"
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
  end

  # 投入金額、在庫の点で、コーラが購入できるかどうかを取得できる。
  # ジュース値段以上の投入金額が投入されている条件下で購入操作を行うと、ジュースの在庫を減らし、売り上げ金額を増やす。
  # 投入金額が足りない場合もしくは在庫がない場合、購入操作を行っても何もしない。
  def buy_drinks
  end

end



####################################################

# ...ステップ0...
# 初期設定（自動販売機インスタンスを作成して、vmという変数に代入する）
# vm = VendingMachine.new
# 作成した自動販売機に100円を入れる
# vm.slot_money (100)
# 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
# vm.current_slot_money
# 作成した自動販売機に入れたお金を返してもらう
# vm.return_money

class Drink
  #attr_readerはインスタンス変数の読み出し専用アクセサを定義できる。
  attr_reader :name, :price

  #クラスの初期化
  def initialize(name, price)
    @name = name
    @price = price
  end
# selfを使用することで、colaをインスタンス化することなく、クラス名を使って呼び出せる。
  def self.cola
    cola = Drink.new('コーラ', 120)
  end

  # def self.redbull
  #   redbull = Drink.new('レッドブル', 200)
  # end

  # def self.water
  #   water = Drink.new('水', 100)
  # end

end

class VendingMachine < Drink
  
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  #..... イミュータブル(中身を変更できない）な定数を定義したいときはfreezeを使う
  MONEY = [10, 50, 100, 500, 1000].freeze
  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  #..... initializeメソッドを使うとインスタンスに初期データを持たせることができる
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
    @store_drink = []
    # 初期状態でコーラ5本格納
    5.times{@store_drink.push(Drink.cola)}

    # 在庫数
    @stock = @store_drink.size
  end

  # 投入金額の総計を取得できる。
  def current_slot_money
    # 自動販売機に入っているお金を表示する
    # @slot_money
    puts "#{@slot_money}円入っています。"
  end

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  def slot_money(money)
    # ...ステップ1...
    # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
    # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    #..... include？メソッド = 引数で指定した要素が配列や文字列内に入っているか判定するメソッド
    #..... 「unless」文は条件式が偽の場合の処理を記述するのに使われる
    if MONEY.include?(money)
      # 投入金額の総計を取得できる
      # @slot_money += money
      puts "投入金額の合計は#{@slot_money += money}円です。"
    else
      # 自動販売機にお金を入れる
      puts "#{money}円は使用できません。"
    end
  end

  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    # 返すお金の金額を表示する
    puts "お釣りは#{@slot_money}円です。"
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
  end

  def stock_drink
    # 格納されているジュースの情報（値段と名前と在庫）を取得できる。
    puts "#{(Drink.cola).name}:#{(Drink.cola).price}円:#{@stock}本"
  end

  def purchase
    #投入金額、在庫の点で、コーラが購入できるかどうかを取得できる。
    if @slot_money >= 120
      puts "買える"
    else
      puts "買えない"
    end

  end

end

