class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]


    def occur
        m = @text.downcase
        y = @special_word.downcase
        m.split.count(y)
    end

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(" ", "").length

    @word_count = @text.split.length

    @occurrences = occur

  end


  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    @monthly_payment = ((@principal)*((@apr/100)/12)*((1+((@apr/100)/12))**(@years*12)))/(((1+((@apr/100)/12))**(@years*12))-(1))

  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending-@starting
    @minutes = (@ending-@starting)/60
    @hours = ((@ending-@starting)/3600)
    @days = ((@ending-@starting)/(3600*24))
    @weeks = ((@ending-@starting)/(3600*24*7))
    @years = ((@ending-@starting)/(3600*24*7*52))
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================


 def variance
        ary = (@numbers).to_a
        v = ary.inject(0.0) {|s,x| s + (x-mean)**2}
        v/ary.count
    end

    def median
        sorted = @numbers.sort
        len = sorted.length
        return (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
    end

    def mode
        arr = @numbers
        freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
        jon = arr.uniq.max_by{ |i| arr.count( i ) }
    end

    def mean
        (@numbers.inject{|sum,x| sum + x })/(@numbers.count)
    end

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @numbers.max - @numbers.min

    @median = median

    @sum = @numbers.inject{|sum,x| sum + x }

    @mean = mean

    @variance = variance

    @standard_deviation = Math.sqrt(variance)

    @mode = mode


  end

end
