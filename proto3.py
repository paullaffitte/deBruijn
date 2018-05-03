#! /usr/bin/python3

def lyndonWord(base, maxLength, previousWord):
    wordLen = len(previousWord)
    newWord = list(previousWord)

    while len(previousWord) < maxLength: # repeat word to fill exactly n syms
        previousWord.append(previousWord[-wordLen])

    while previousWord and previousWord[-1] == base - 1: # delete trailing z's
        previousWord.pop()

    if previousWord:
        previousWord[-1] += 1

    return previousWord;

def lyndonWords(base, maxLength):
    word = [0]
    words = []
    while word:
        words.append(list(word))
        word = lyndonWord(base, maxLength, word)
    return words

def deBruijn(base, maxLength):
    words = lyndonWords(base, maxLength)
    print (words)
    bruijn = []

    for word in words:
        if maxLength % len(word) == 0:
            bruijn += word
    return ''.join(str(num) for num in bruijn)

print(deBruijn(3, 4))