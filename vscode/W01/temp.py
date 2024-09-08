def length(v):
    sum = 0
    for i in range(len(v)):
        sum += v[i]**2
    return sum**0.5

a = [1,2]
b = [3,-1]
c = [-2,4]


res0, res1, res2 = length(a), length(b), length(c)

print(res0+res1+res2)