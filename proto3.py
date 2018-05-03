#! /usr/bin/python3

def lyndonWord(base, maxLength, previousWord):
    previousWord[-1] += 1
    wordLend = len(previousWord)
    newWord = list(previousWord)

    while len(previousWord) < maxLength: # repeat word to fill exactly n syms
        previousWord.append(previousWord[-wordLend])

    while previousWord and previousWord[-1] == base - 1: # delete trailing z's
        previousWord.pop()

    return (previousWord, newWord);

def lyndonWords(base, maxLength):
    previous = [-1]
    words = []
    while previous:
        (previous, word) = lyndonWord(base, maxLength, previous)
        words.append(word)
    return words

def deBruijn(base, maxLength):
    words = lyndonWords(base, maxLength)
    print (words)
    bruijn = []

    for word in words:
        if maxLength % len(word) == 0:
            bruijn += word
    return ''.join(str(num) for num in bruijn)

print(deBruijn(2, 2))