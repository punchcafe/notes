# Hangman game
#

# -----------------------------------
# Helper code
# You don't need to understand this helper code,
# but you will have to know how to use the functions
# (so be sure to read the docstrings!)

import random

WORDLIST_FILENAME = "words.txt"

import string


def getAvailableLetters(lettersGuessed):
    availableletters=''
    for i in string.ascii_lowercase:
        if i not in lettersGuessed:
            availableletters += i
    return availableletters
    # FILL IN YOUR CODE HERE...


def loadWords():
    """
    Returns a list of valid words. Words are strings of lowercase letters.
    
    Depending on the size of the word list, this function may
    take a while to finish.
    """
    print("Loading word list from file...")
    # inFile: file
    inFile = open(WORDLIST_FILENAME, 'r')
    # line: string
    line = inFile.readline()
    # wordlist: list of strings
    wordlist = line.split()
    print("  ", len(wordlist), "words loaded.")
    return wordlist

def chooseWord(wordlist):
    """
    wordlist (list): list of words (strings)

    Returns a word from wordlist at random
    """
    return random.choice(wordlist)

def isWordGuessed(secretWord, lettersGuessed):
    for i in secretWord:
        if i not in lettersGuessed:
            return False
    return True


def getGuessedWord(secretWord, lettersGuessed):
    '''
    secretWord: string, the word the user is guessing
    lettersGuessed: list, what letters have been guessed so far
    returns: string, comprised of letters and underscores that represents
      what letters in secretWord have been guessed so far.
    '''
    display = ''
    for i in secretWord:
        if i in lettersGuessed:
            display += (i + ' ')
        else:
            display += '_ '
    return display


# end of helper code
# -----------------------------------

# Load the list of words into the variable wordlist
# so that it can be accessed from anywhere in the program
wordlist = loadWords()


    

def hangman(secretWord):
    '''
    secretWord: string, the secret word to guess.

    Starts up an interactive game of Hangman.

    * At the start of the game, let the user know how many 
      letters the secretWord contains.

    * Ask the user to supply one guess (i.e. letter) per round.

    * The user should receive feedback immediately after each guess 
      about whether their guess appears in the computers word.

    * After each round, you should also display to the user the 
      partially guessed word so far, as well as letters that the 
      user has not yet guessed.

    Follows the other limitations detailed in the problem write-up.
    '''
    # FILL IN YOUR CODE HERE...






# When you've completed your hangman function, uncomment these two lines
# and run this file to test! (hint: you might want to pick your own
# secretWord while you're testing)

# secretWord = chooseWord(wordlist).lower()
# hangman(secretWord)

def hangman(secretword):
    lettersguessed = ''
    wrongGuess = 0
    print('Welcome to the game Hangman!')
    print('I am thinking of a word that is '+str(len(secretword))+' letters long.')
    while not isWordGuessed(secretword,lettersguessed) and wrongGuess < 8:
        print('-----------')
        print('you have '+str(8-wrongGuess)+' guesses left')
        print('Available letters : '+getAvailableLetters(lettersguessed))
        newletter = input('please guess a letter: ')
        if newletter in lettersguessed:
            print("Oops! You've already guessed that letter: "+getGuessedWord(secretword,lettersguessed))
        elif newletter not in secretword:
            wrongGuess +=1
            lettersguessed += newletter
            print('Oops! That letter is not in my word: '+getGuessedWord(secretword,lettersguessed))
        else:
            lettersguessed += newletter
            print('Good guess: '+getGuessedWord(secretword, lettersguessed))
    if isWordGuessed(secretword,lettersguessed) :
        print('-----------')
        print('Congratulations, you won!')
    else:
        print('-----------')
        return('Sorry, you ran out of guesses. The word was '+secretword+'.')

hangman(chooseWord(loadWords()))