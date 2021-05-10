# ここはグループワークのそのままコピペ
# ※これは4回目のグループワーク時点のもの

class Drink
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def self.cola
    self.new('cola', 120)
  end

  def self.water
    self.new('water', 100)
  end

  def self.redbull
    self.new('redbull', 200)
  end
end

# ジュース値段以上の投入金額が投入されている条件下で購入操作を行うと、ジュースの在庫を減らし、売り上げ金額を増やす。
# このコードの使用用途？？
# class Stocks
#   def initialize(name, price, stocks)
#     @stocks = [name, price.to_i, stocks.to_i]
#   end
#   def info1
#     puts @stocks
#   end
# end
# cola = Stocks.new(“cola”, 120, 5)
#cola.info(“cola”, 120, 5)
#cola.info1

class VendingMachine
  # ステップ１ 扱えないお金の例コード
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze 

  # 初期値
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
    # 売上がまだ無い
    @sale_amount = 0
    # 初期値のストック数
    # @stocks = [name, price.to_i, stocks.to_i]
    # @stocks = {["cola", 120, 5]}
    @stocks = {cola: 5, water: 0, redbull: 0}
  end

  # 投入金額の総計を取得できる。
  def current_slot_money
    # 自動販売機に入っているお金を表示する
    puts "現在の投入金額の合計は#{@slot_money}円です。"
  end

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  def slot_money(money)
    # ...ステップ1...
    # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
    # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    if MONEY.include?(money)
      # 投入金額の総計を取得できる
      @slot_money += money
      puts "現在の投入金額の合計は#{@slot_money}円です。"
    else
      # 自動販売機にお金を入れる
      puts "#{money}円は使用できません。"
    end
  end

  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    # 返すお金の金額を表示する
    puts "#{@slot_money}円をお返しします。"
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
  end

  #ステップ2 格納されているジュースの情報（値段と名前と在庫）を取得できる。
  def stock_drink(drink) #ドリンクを指定しないとデータ抽出できない？
    #puts @stocks
    # @stocks.map {|name, price|
    #   "#{name}:#{price}"
    # }
    puts "#{drink.name}は#{drink.price}円です。#{@stocks[drink.name.to_sym]}本あります。"
  end

  #購入操作
  #ステップ5 ジュース値段以上の投入金額が投入されている条件下で購入操作を行うと、釣り銭（投入金額とジュース値段の差分）を出力する。
  def buy(drink)
    while @stocks[drink.name.to_sym] >= 1
      if @slot_money >= drink.price
        @slot_money -= drink.price
        @stocks[drink.name.to_sym] -= 1
        @sale_amount += drink.price
        p "#{drink.name}を1本購入しました。"
        p "お釣り（残金）は#{@slot_money}円です。"
      else
        p "購入できません。"
      end
      break
    end
  end

  #在庫の追加
  def store(drink)
    puts "#{drink.name}は#{@stocks[drink.name.to_sym] += 1}本の在庫があります。"
  end

  # ステップ３ 投入金額、在庫の点で、コーラが購入できるかどうかを取得できる
  def purchasable(drink)
    if @slot_money >= drink.price && @stocks[drink.name.to_sym] > 0
      puts "#{drink.name}は購入できます。"
    elsif @slot_money < drink.price && @stocks[drink.name.to_sym] > 0
      puts "購入金額が足りません。お金を入れてください。"
    elsif @stocks[drink.name.to_sym] = 0
      puts "在庫が無いので購入できません。"
    end
  end

  #ステップ4 投入金額、在庫の点で購入可能なドリンクのリストを取得できる。
  def purchasable_drink_names
    @stocks
  end

  #ステップ3 現在の売上金を取得できる
  def sale_amount
    puts "現在の売上合計は#{@sale_amount}円です。"
  end

  #ステップ5 ジュース値段以上の投入金額が投入されている条件下で購入操作を行うと、釣り銭（投入金額とジュース値段の差分）を出力する。
  def purchasable(drink)
    if @slot_money >= drink.price && @stocks[drink.name.to_sym] > 0
      "#{drink.name}:#{@stocks[drink.name.to_sym]}"
    else
      "#{drink.name}:買えません"
    end
  end

  def purchasable_drink_list
    puts (purchasable(Drink.cola))
    puts (purchasable(Drink.water))
    puts (purchasable(Drink.redbull))
  end

end
