require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("/home/theonapoly/Bureau/thp/week-5/day-1/sinatra-project/lib/db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
      csv.close
    end
  end

  def self.all
    all_gossips = []
    CSV.read("/home/theonapoly/Bureau/thp/week-5/day-1/sinatra-project/lib/db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id_gossip)
    return Gossip.all[id_gossip.to_i - 1]
  end
  
end