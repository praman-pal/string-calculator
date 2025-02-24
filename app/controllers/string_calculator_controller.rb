class StringCalculatorController < ApplicationController
  def index
  end

  def add
    numbers = params[:numbers]
    @result = 0 if numbers.empty?
    delimiter = extract_delimiter(numbers)
    numbers = extract_numbers(numbers)
    parsed_nums = parse_numbers(numbers, delimiter)
    error = check_for_negatives(parsed_nums)
    @result  = error ? error : parsed_nums.sum
    redirect_to action: "result", result: @result
  end

  def result
    @result = params[:result] if params[:result]
  end

  private

  def extract_delimiter(numbers)
    return numbers[2] if numbers.start_with?("//")
    ","
  end

  def extract_numbers(numbers)
    return numbers.split("\n", 2).last if numbers.start_with?("//")
    numbers
  end

  def parse_numbers(numbers, delimiter)
    numbers.split(/[\n#{delimiter}]/).map(&:to_i)
  end

  def check_for_negatives(nums)
    negatives = nums.select { |num| num < 0 }
    "Negative numbers not allowed: #{negatives}" unless negatives.empty?
  end
end
