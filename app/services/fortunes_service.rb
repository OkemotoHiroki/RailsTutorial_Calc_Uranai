class FortunesService
  attr_accessor :birthmonth
  attr_reader :rank, :color_list, :rank_list
  def initialize(birthmonth)
    raise ArgumentError, "1~12を入力してください" if birthmonth < 1 or 12 < birthmonth
    @birthmonth = birthmonth
    @color_list = [ "黒", "白", "赤", "青", "黄色", "緑", "金", "オレンジ", "グレー", "水色", "紫", "ピンク" ].shuffle
    @rank_list = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ].shuffle
    @rank = get_rank(birthmonth)
  end

  def get_rank(birthmonth)
    rank = 1
    @rank_list.each do |i|
      if i == birthmonth
        return rank
      end
      rank += 1
    end
  end

  def get_lucky_color
    @color_list[@rank - 1]
  end

  def get_ranking_list
    list = []
    (1..12).each do |i|
      list.push(rank: i, lucky_color: @color_list[i - 1], month: @rank_list[i - 1])
    end
    list
  end
end
