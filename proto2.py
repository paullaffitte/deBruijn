#! /usr/bin/python3
def de_bruijn(base, order):
    """
    de Bruijn sequence for alphabet base
    and subsequences of length order.
    """
    try:
        # let's see if base can be cast to an integer;
        # if so, make our alphabet a list
        _ = int(base)
        alphabet = list(map(str, range(base)))

    except (ValueError, TypeError):
        alphabet = base
        base = len(base)

    lyndon = [0] * base * order
    sequence = []

    def db(t, p):
        def generate(letter):
            if letter < base:
                lyndon[t] = letter
                return db(t + 1, t) + generate(letter + 1)
            return []

        if t <= order:
            letter = lyndon[t - p]
            lyndon[t] = letter
            return db(t + 1, p) + generate(letter + 1)
        elif order % p == 0:
            return lyndon[1:p + 1]
        return []

    bruijnSeq = db(1, 1)
    return "".join(alphabet[i] for i in bruijnSeq)

print(de_bruijn("abc", 5))
