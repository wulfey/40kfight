def alphabetExercise(vocabulary)


    charAry = []
    vocabulary.each do |word|
        split = word.split("")
        # split.sort!
        split.uniq!
        charAry << split
    end

    letterAry = []
    26.times do
        letterAry << []
    end




    print charAry



end

def numOf(char)

    case char
    when "a"
        return 0

end

vocabulary = ["globe",
 "job",
 "excellent",
 "round",
 "joy",
 "lock",
 "vial",
 "knot",
 "wait",
 "waist",
 "great",
 "abuse",
 "academic",
 "accept",
 "access",
 "zone",
 "account",
 "accuse",
 "act",
 "turn",
 "come",
 "move",
 "leader",
 "query",
 "school",
 "part",
 "letter",
 "roll",
 "yield",
 "next",
 "free",
 "froze",
 "pair",
 "arrow",
 "feel",
 "float",
 "mean",
 "flash"]

 alphabetExercise(vocabulary)
