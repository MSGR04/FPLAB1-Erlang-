def euler9():
    for a in range(1, 1000):
        for b in range(a + 1, 1000):
            c = 1000 - a - b
            if c > b and a*a + b*b == c*c:
                return a * b * c

def d(n):
    if n == 1:
        return 0
    s = 1
    i = 2
    while i * i <= n:
        if n % i == 0:
            s += i
            if i != n // i:
                s += n // i
        i += 1
    return s

def euler21(limit=10000):
    total = 0
    for a in range(2, limit):
        b = d(a)
        if b != a and d(b) == a:
            total += a
    return total


print(euler9())  # 31875000
print(euler21())