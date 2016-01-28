#politicians characteristics
class Politician
  attr_accessor :name, :party
  def initialize(name, party)
    @name = name
    @party = party
  end
end

#voter characteristics
class Voter
  attr_accessor :name, :affiliation
  def initialize(name, affiliation)
    @name = name
    @affiliation = affiliation
  end
end

class World

  def initialize
    @politician_array = []
    @voter_array = []
  end

  # @new_politician = []

  def error
    puts ["Que tu dices?, try again", "Sorry no, try again", "I don't understand, try again"].sample
  end

  #method used to create new entries
  def create
    puts "Which one would you like to create?"
    puts "(P)olitician or (V)oter"
    new_entry = gets.chomp.downcase
    case new_entry
    when "p"
      new_politician
    when "v"
      new_voter
    else
      error
      puts
      create
    end
  end

  #method for new politicians
  def new_politician
    puts "Please enter the first and last name of the new politician"
    # should be local variable, no need for instance variable
    @politician = gets.chomp.capitalize!
    # political_party
    puts "What party does the politician belong to?"
    puts "(D)emocrat or (R)epublican"
    cparty = gets.chomp.downcase
    case cparty
    when "d"
      #@politician_array << Politician.new(@politician, "Democrat")
      poli = Politician.new(@politician, "Democrat")
      @politician_array << [poli.name, poli.party]

    when "r"
      poli = Politician.new(@politician, "Republican")
      @politician_array << [poli.name, poli.party]

    else
      error
      puts
      new_politician
    end
    puts "#{@politician} added!"
    puts
    main_menu
  end

  #method for new voters
  def new_voter
    puts "Please enter the first and last name of the new voter"
    @voter = gets.chomp.capitalize!
    puts "Please enter the political affiliation of the voter"
    puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
    voterparty = gets.chomp.downcase
    case voterparty
    when "l"
      affi = Voter.new(@voter, "Liberal")
      @voter_array << [affi.name, affi.affiliation]
    when "c"
      affi = Voter.new(@voter, "Conservative")
      @voter_array << [affi.name, affi.affiliation]
    when "t"
      affi = Voter.new(@voter, "Tea Party")
      @voter_array << [affi.name, affi.affiliation]
    when "s"
      affi = Voter.new(@voter, "Socialist")
      @voter_array << [affi.name, affi.affiliation]
    when "n"
      affi = Voter.new(@voter, "Neutral")
      @voter_array << [affi.name, affi.affiliation]
    else
      error
      puts
      new_voter
    end
    main_menu
  end


  #defines the political party of the politician
  # def political_party
  #   puts "What party does the politician belong to?"
  #   puts "(D)emocrat or (R)epublican"
  #   cparty = gets.chomp.downcase
  #   case cparty
  #   when "d"
  #     poli = Politician.new(@politician, "Democrat")
  #     @politician << [poli.name, poli.party]
  #
  #   when "r"
  #     poli = Politician.new(@politician, "Republican")
  #     @politician << [poli.name, poli.party]
  #
  #   else
  #     error
  #     puts
  #     political_party
  #   end
  # end

  #method to gather the political affiliation of voter
  # def voter_affiliation
  #   puts "Please enter the political affiliation of the voter"
  #   puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
  #   voterparty = gets.chomp.downcase
  #   case voterparty
  #   when "l"
  #     affi = Voter.new(@voter, "Liberal")
  #     @voter << [affi.name, affi.affiliation]
  #   when "c"
  #     affi = Voter.new(@voter, "Conservative")
  #     @voter << [affi.name, affi.affiliation]
  #   when "t"
  #     affi = Voter.new(@voter, "Tea Party")
  #     @voter << [affi.name, affi.affiliation]
  #   when "s"
  #     affi = Voter.new(@voter, "Socialist")
  #     @voter << [affi.name, affi.affiliation]
  #   when "n"
  #     affi = Voter.new(@voter, "Neutral")
  #     @voter << [affi.name, affi.affiliation]
  #   else
  #     error
  #     puts
  #     voter_affiliation
  #   end
  #   main_menu
  # end

  def update

    puts "Below are the Politicians and Voters you have created:"
    puts "Democratic Nominees:"
    # Repeated logic, extract to a method
    @politician_array.each do |x|
      case x[1]
      when "Democrat"
        puts "Candidate: #{x[0]}"
      end
    end
    puts "Republican Nominees:"
    @politician_array.each do |x|
      case x[1]
      when "Republican"
        puts "Candidate: #{x[0]}"
      end
    end
    puts "Registered Voters:"
    @voter_array.each do |x|
      puts "#{x[0]}: #{x[1]}"
    end
    ###
    puts "Would you like to update a (P)olitican or (V)oter or go to the (M)ain menu"
    answer = gets.chomp.downcase
    case answer
    when "p"
      update_politician
    when "v"
      update_voter
    when "M"
      main_menu
    else
      error
      puts
      update
    end
  end

  def update_politician
    puts "Who would you like to update?"
    @input = gets.chomp
    @politician_array.each do |x|
      if x.include? @input #if x.name == input
        puts "Please enter the Politicians name"
        new_name = gets.chomp.capitalize
        x[0] = new_name #x.name = new_name
        update_party(x)
      end
    end
    error
    puts
    update_politician
  end

  def update_voter
    puts "Which voter would you like to update?"
    @input = gets.chomp
    @voter_array.each do |a|
      if x.include? @input
        puts "Please enter the Voters name"
        new_name = gets.chomp.capitalize
        a[0] = new_name
        update_affiliation
      end
    end
    error
    puts
    update_voter
  end

  def update_affiliation
    @voter_array.each do |a|
      puts "Would you like to update their Affiliation?"
      decision = gets.chomp.downcase
      case decision
      when "y"
        puts "What is the voter's new affiliation?"
        puts "(T)ea Party, (C)onservative, (N)eutral, (L)iberal, (S)ocialist"
        new_affiliation = gets.chomp.downcase
        if new_affiliation == "l"
          new_affiliation = "Liberal"
          a[1] = new_affiliation
          main_menu
        elsif new_affiliation == "c"
          new_affiliation = "Conservative"
          a[1] = new_affiliation
          main_menu
        elsif new_affiliation == "t"
          new_affiliation = "Tea Party"
          a[1] = new_affiliation
          main_menu
        elsif new_affiliation == "s"
          new_affiliation = "Socialist"
          a[1] = new_affiliation
          main_menu
        elsif new_affiliation == "n"
          new_affiliation = "Neutral"
          a[1] = new_affiliation
          main_menu
        else
          update_affiliation
        end
      when "n"
        main_menu
      else
        error
        puts
        update_affiliation
      end
    end
  end

  def update_party x 
    #@politician_array.each do |x| # no need for .each loop here
      puts "Are you sure you want to update? (Y)es or (N)o?"
      decision2 = gets.chomp.downcase
      case decision2
      when "y"
        puts "What is the candidate's new party? (R)epublican or (D)emocrat."
        new_party = gets.chomp.downcase
        if new_party == "r"
          new_party = "Republican"
          x[1] = new_party #x.party = new_party 
          main_menu
        elsif new_party == "d"
          new_party = "Democrat"
          x[1] = new_party
          main_menu
        else
          error
          puts
          update_party x
        end
      when "n"
        main_menu
      else
        error
        puts
        update_party
      end
    end
  end
  #this method describes the main menu and
  def main_menu
    puts "What would you like to do?"
    puts "(C)reate, (U)pdate, (L)ist, (D)elete or (E)nd"
    menu = gets.chomp.downcase

    case menu
    when "c"
      create
    when "u"
      update
    when "l"
      list
    when "d"
      delete_method
    when "e"
      puts "=" * 50
      puts "Goodbye and have a nice day!"
      puts "=" * 50
      #added this as a break because every method is linked together and the program would never end
    else
      error
      puts
      main_menu
    end
  end

  def list
    puts "Democratic Nominees"
    @politician_array.each do |x|
      # if x.party == "Democrat"
      case x[1]
      when "Democrat"
        puts "Candidate: #{x[0]}" # x.name
      end
    end
    puts "Republican Nominees:"
    @politician_array.each do |x|
      case x[1]
      when "Republican"
        puts "Candidate: #{x[0]}"
      end
    end
    puts "Registered Voters:"
    @voter_array.each do |x| 
      puts "#{x[0]}: #{x[1]}"# "#{x.name}: #{x.party}"
    end
    puts "Would you like to (U)pdate or go to the (M)ain menu?"
    lupdate = gets.chomp.downcase
    case lupdate
    when "u"
      update
    when "m"
      main_menu
    else
      error
      puts
      list
    end
  end

  def delete_method
    puts "Below are the Politicians and Voters you have created:"
    puts "Democratic Nominees:"
    @politician_array.each do |x|
      case x[1]
      when "Democrat"
        puts "Candidate: #{x[0]}"
      end
    end
    puts "Republican Nominees:"
    @politician_array.each do |x|
      case x[1]
      when "Republican"
        puts "Candidate: #{x[0]}"
      end
    end
    puts "Registered Voters:"
    @voter_array.each do |x|
      puts "#{x[0]}: #{x[1]}"
    end
    puts "Would you like to delete a (P)olitican or (V)oter or go to the (M)ain menu"
    erase = gets.chomp.downcase
    case erase
    when "p"
      erase_politician
    when "v"
      erase_voter
    when "m"
      main_menu
    else
      error
      puts
      delete_method
    end
  end

  itician
    @politician_array.each do |y|
      puts "Which Voter would you like to delete?"
      poli_choice = gets.chomp.capitalize!
      puts "Are you sure you want to delete this? (Y)es or (N)o"
      choice = gets.chomp.downcase
      case poli_choice
      when "y"
        @politician_array.delete(y)
        puts "Politician deleted!"
        main_menu
      when "n"
        puts "Delete cancelled!"
        puts
        main_menu
      else
        error
        puts
        erase_voter
      end
    end
  end



  #
  def erase_voter
    # 1. Ask which voter to delete
    # 2. Find voter in array (.each ... if x.name == input)
    # 3. Ask for confirmation
    # 4. delete
    @voter_array.each do |x|
      puts "Which Voter would you like to delete?"
      voter_choice = gets.chomp.capitalize!
      puts "Are you sure you want to delete this? (Y)es or (N)o"
      choice = gets.chomp.downcase
      case choice
      when "y"
        @voter_array.delete(x)
        puts "Voter deleted!"
        puts
        main_menu
      when "n"
        puts "Delete cancelled!"
        puts
        main_menu
      else
        error
        puts
        erase_voter
      end
    end
  end
end

  puts "=" * 50
  puts "Welcome to the Voting Simulator"
  puts "=" * 50
  puts "This is a directory that provides the ability to create, update, show and delete voters and candidates."
  puts "=" * 50
  world = World.new
  world.main_menu
