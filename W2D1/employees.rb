require 'byebug'

class Employee

  attr_accessor :name, :title, :salary, :boss, :subordinates

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @subordinates = nil

    join_team unless boss.nil?
  end

  def join_team
    # debugger
    boss.subordinates << self
    # boss.boss.subordinates << self unless boss.boss.nil?
  end

  def bonus(multiplier)
    @bonus = salary * multiplier
  end

  def total_sub_salaries
    salary
  end

  def inspect
    @name
  end

end

class Manager < Employee

  def initialize(name, title, salary, boss)
    super
    @subordinates = []
  end

  # def join_team
  #   super
  #   # boss.subordinates += subordinates unless boss.nil?
  # end

  def bonus(multiplier)
    return 0 if self.subordinates.nil?

    total = total_sub_salaries
    self.subordinates.each do |person|
      total += person.salary
    end
    total * multiplier
  end

  def total_sub_salaries
    return self.salary if subordinates.nil?

    total = 0
    self.subordinates.each do |worker|
      total += worker.total_sub_salaries
    end

    total
  end

  def inspect
    @name
  end
end

ned = Manager.new('Ned', "Founder", 1_000_000, nil)
darren = Manager.new('Darren', "TA Manager", 78_000, ned)
shawna = Employee.new('Shawna', "TA", 12_000, darren)
david = Employee.new('David', "TA", 10_000, darren)

# puts ned.subordinates

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
