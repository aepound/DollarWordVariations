# Program to find Dollar Words
# Assign each letter a value, starting with a is 1 penny
# b is 2 pennies, an so forth through the alphabet.
# Add the value of all the letters in a word and if the sum
# equals 1 dollar, then it is a Dollar Word
import string

# make a dictionary with the values for all letters
value_dict = { }
value = 1
for letter in string.ascii_lowercase :
    value_dict[letter] = value
    value += 1
value = 1
for letter in string.ascii_uppercase :
    value_dict[letter] = value
    value += 1
        

# determine if a given string is a Dollar Word
# if the string has non-alphabetical characters, it is not a Dollar Word
def is_dollarword(word):
    score = 0
    if not word.isalpha():
        return False
        
    for letter in word:
        score += value_dict[letter]

    return score == 100

# ask for an input file
# the input file should have one word per line
filename = input("What file do you want to search for dollar words? ")
inputFile = open(filename, 'r')

dollar_words = []
word_list = inputFile.readlines()

# go through the word list
for word in word_list:
    word = word.strip()
    if is_dollarword(word):
        dollar_words.append(word)

print("Found", len(dollar_words), "dollar words in this file.")
print(dollar_words)
inputFile.close()

outputFile = open("dollarwords.txt", 'a')

# output the list of words to a file
for word in dollar_words:
    outputFile.write(word + "\n")
outputFile.close()



      

