require 'pg'
require 'faker'

class Table
  @@connection = PG.connect( dbname: "sandbox" )

  def self.insert(data)
    @@connection.exec "insert into #{self.to_s.downcase} ( #{ transform_keys(data.keys) } ) values ( #{ transform_vals(data.values) } )"
  end

  def self.find(id)
    @@connection.exec("select * from #{self.to_s.downcase} where id=#{id}").first
  end

  private

  def self.transform_vals(values)
    values.map { |v| "\'#{v}\'" }.join(",")
  end

  def self.transform_keys(keys)
    keys.map(&:to_s).join(',')
  end
end

class User < Table
end

# puts Musicals.find(1)

Musicals.insert({:title => "THe Sound of Music", :year => "1989", :composer => "Rodgers"})
puts Musicals.find(2)
