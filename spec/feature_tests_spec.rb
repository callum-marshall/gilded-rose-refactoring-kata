require 'gilded_rose'

describe 'Feature Tests' do

  context "updating quality for '+5 Dexterity Vest'" do
    it "correctly updates quality after over time" do
      dexterity_vest = [Item.new(name="+5 Dexterity Vest", sell_in=1, quality=11)]
      gilded_rose = GildedRose.new(dexterity_vest)
      gilded_rose.update_quality()
      expect(dexterity_vest[0].to_s).to eq "+5 Dexterity Vest, 0, 10"
      gilded_rose.update_quality()
      expect(dexterity_vest[0].to_s).to eq "+5 Dexterity Vest, -1, 8"
      gilded_rose.update_quality()
      expect(dexterity_vest[0].to_s).to eq "+5 Dexterity Vest, -2, 6"
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

  context "updating quality for 'Elixir of the Mongoose'" do
    it "correctly updates quality after over time" do
      mongoose_elixir = [Item.new(name="Elixir of the Mongoose", sell_in=2, quality=4)]
      gilded_rose = GildedRose.new(mongoose_elixir)
      gilded_rose.update_quality()
      expect(mongoose_elixir[0].to_s).to eq "Elixir of the Mongoose, 1, 3"
      gilded_rose.update_quality()
      expect(mongoose_elixir[0].to_s).to eq "Elixir of the Mongoose, 0, 2"
      gilded_rose.update_quality()
      expect(mongoose_elixir[0].to_s).to eq "Elixir of the Mongoose, -1, 0"
    end
  end

  context "updating quality for 'Sulfuras, Hand of Ragnaros'" do
    it "correctly updates quality after over time" do
      sufuras = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=5, quality=50)]
      gilded_rose = GildedRose.new(sufuras)
      expect(sufuras[0].to_s).to eq "Sulfuras, Hand of Ragnaros, 5, 50"
      gilded_rose.update_quality()
      expect(sufuras[0].to_s).to eq "Sulfuras, Hand of Ragnaros, 5, 50"
      gilded_rose.update_quality()
      expect(sufuras[0].to_s).to eq "Sulfuras, Hand of Ragnaros, 5, 50"
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
end
