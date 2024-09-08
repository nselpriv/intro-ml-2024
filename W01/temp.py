def length(v):
    leng = 0
    for elem in range(v):
        temp = elem ** 2
        leng += temp
    sqr = leng**(1/2)
    return sqr

print('a', length(va))
print('b', length(vb))
assert length(va) == 8**0.5
assert length(vb) == 5