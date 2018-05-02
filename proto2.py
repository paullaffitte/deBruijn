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

    tab = [0] * base * order
    sequence = []

    def db(t, p):
        def generate(letter):
            if letter < base:
                tab[t] = letter             #   tab[t] = letter
                db(t + 1, t)                #   -- db (t + 1) p, for tab[t] = [l | l <- base, l > tab[t - p]]
                generate(letter + 1)

        if t <= order:                      # t <= order
            tab[t] = tab[t - p]
            db(t + 1, p)                    #   tab = db (t + 1) p, with tab[t] = tab[t - p]
            generate(tab[t] + 1)
        elif order % p == 0:                # order % p == 0
            sequence.extend(tab[1:p + 1])   #   sequence ++ tab[1:p + 1]

    db(1, 1)
    return "".join(alphabet[i] for i in sequence)

print(de_bruijn('abc', 5))
