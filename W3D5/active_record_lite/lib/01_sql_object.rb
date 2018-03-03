require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    if @table.nil?
      @table = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          #{table_name}
      SQL
    end

    @columns = @table.first.map do |column_name|
      column_name.to_sym
    end

    @columns
  end

  def self.finalize!
    columns.each do |column_name|
      define_method column_name do
        attributes[column_name]
      end

      define_method "#{column_name}=".to_s do |arg|
        attributes[column_name] = arg
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= "#{self}".tableize
  end

  def self.all
    hash_of_entries = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL

    self.parse_all(hash_of_entries)
  end

  def self.parse_all(results)
    arr_of_objects = []
    results.each do |data|
      arr_of_objects << self.new(data)
    end

    arr_of_objects
  end

  def self.find(id)
    search_by_id = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{table_name}.id = #{id}
    SQL

    search_by_id.empty? ? nil : self.parse_all(search_by_id).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      unless self.class.columns.include?(attr_name.to_sym)
        raise "unknown attribute '#{attr_name}'"
      end

      self.send("#{attr_name}=", value)
    end
  end

  def attributes
    if @attributes.nil?
      @attributes = Hash.new
    end

    @attributes
  end

  def attribute_values
    values = []
    self.class.columns.map do |column|
      values << self.send("#{column}")
    end
    values
  end

  def insert
    col_name = self.class.columns.join(", ")
    question_marks = (["?"] * self.class.columns.count).join(", ")

    new_entry = DBConnection.execute(<<-SQL)
      INSERT INTO
        '#{self.class.table_name}(col_name)'
      VALUES
        -- (#{question_marks})
        (#{attribute_values.join(", ")})
    SQL
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
