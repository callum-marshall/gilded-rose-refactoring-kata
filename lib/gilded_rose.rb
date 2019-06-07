class GildedRose

  def initialize(items)
    @items = items
  end

  def aged_brie(item)
    item.sell_in -= 1
    item.quality += 1
    return if item.sell_in >= 0
    item.quality += 1
  end

  def backstage_pass(item)
    item.sell_in -= 1
    item.quality += 1
    if item.sell_in < 10
      item.quality += 1
    end
    if item.sell_in < 5
      item.quality += 1
    end
    if item.sell_in < 0
      item.quality = 0
    end
  end

  def regular(item)
    item.sell_in -= 1
    item.quality -= 1
    return if item.sell_in >= 0
    item.quality -= 1
  end

  def max_quality(item)
    item.quality = 50 if item.quality > 50
  end

  def update_quality()
    @items.each do |item|
      return if item.name.include?("Sulfuras")
      aged_brie(item) if item.name.include?("Brie")
      backstage_pass(item) if item.name.include?("Backstage")
      regular(item) unless item.name.include?("Brie") || item.name.include?("Backstage")
      max_quality(item)
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
