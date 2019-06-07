require 'gilded_rose'

describe 'Feature Tests' do

  context "updating quality for a standard item" do
    it "correctly updates quality after over time" do
      standard_item = [Item.new(name="Standard item", sell_in=1, quality=11)]
      gilded_rose = GildedRose.new(standard_item)
      gilded_rose.update_quality()
      expect(standard_item[0].to_s).to eq "Standard item, 0, 10"
      gilded_rose.update_quality()
      expect(standard_item[0].to_s).to eq "Standard item, -1, 8"
      gilded_rose.update_quality()
      expect(standard_item[0].to_s).to eq "Standard item, -2, 6"
    end
  end

  context "updating quality for 'Aged Brie'" do
    it "correctly updates quality after over time" do
      aged_brie = [Item.new(name="Aged Brie", sell_in=2, quality=0)]
      gilded_rose = GildedRose.new(aged_brie)
      gilded_rose.update_quality()
      expect(aged_brie[0].to_s).to eq "Aged Brie, 1, 1"
      gilded_rose.update_quality()
      expect(aged_brie[0].to_s).to eq "Aged Brie, 0, 2"
      gilded_rose.update_quality()
      expect(aged_brie[0].to_s).to eq "Aged Brie, -1, 4"
    end
  end

  context "updating quality for 'Sulfuras, Hand of Ragnaros'" do
    it "correctly updates quality after over time" do
      sufuras = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=5, quality=80)]
      gilded_rose = GildedRose.new(sufuras)
      expect(sufuras[0].to_s).to eq "Sulfuras, Hand of Ragnaros, 5, 80"
      gilded_rose.update_quality()
      expect(sufuras[0].to_s).to eq "Sulfuras, Hand of Ragnaros, 5, 80"
      gilded_rose.update_quality()
      expect(sufuras[0].to_s).to eq "Sulfuras, Hand of Ragnaros, 5, 80"
    end
  end

  context "updating quality for 'Backstage passes to a TAFKAL80ETC concert'" do
    it "correctly updates quality after over time" do
      backstage_pass = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=11, quality=5)]
      gilded_rose = GildedRose.new(backstage_pass)
      gilded_rose.update_quality()
      expect(backstage_pass[0].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 10, 6"
      6.times {gilded_rose.update_quality()}
      expect(backstage_pass[0].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 4, 19"
      4.times {gilded_rose.update_quality()}
      expect(backstage_pass[0].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 0, 31"
      gilded_rose.update_quality()
      expect(backstage_pass[0].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, -1, 0"
    end
  end

  context "updating quality for a Conjured item" do
    it "correctly updates quality after over time" do
      conjured_item = [Item.new(name="Conjured item", sell_in=5, quality=30)]
      gilded_rose = GildedRose.new(conjured_item)
      gilded_rose.update_quality()
      expect(conjured_item[0].to_s).to eq "Conjured item, 4, 28"
      3.times {gilded_rose.update_quality()}
      expect(conjured_item[0].to_s).to eq "Conjured item, 1, 22"
    end
  end

  context "updating quality beyond the limits" do
    it "doesn't let item quality go above 50" do
      aged_brie = [Item.new(name="Aged Brie", sell_in=0, quality=47)]
      gilded_rose = GildedRose.new(aged_brie)
      gilded_rose.update_quality()
      expect(aged_brie[0].to_s).to eq "Aged Brie, -1, 49"
      gilded_rose.update_quality()
      expect(aged_brie[0].to_s).to eq "Aged Brie, -2, 50"
    end
    it "doesn't let item quality go below 0" do
      conjured_item = [Item.new(name="Conjured item", sell_in=10, quality=2)]
      gilded_rose = GildedRose.new(conjured_item)
      gilded_rose.update_quality()
      expect(conjured_item[0].to_s).to eq "Conjured item, 9, 0"
      3.times {gilded_rose.update_quality()}
      expect(conjured_item[0].to_s).to eq "Conjured item, 6, 0"
    end
  end


end
