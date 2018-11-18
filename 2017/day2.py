import sys

def check(row):
    so_far = set()
    for i in row:
        if i in so_far:
            return 1
        for d in so_far:
            if max(d,i) % min(d,i) == 0:
                return max(d,i)/min(d,i)
        so_far.add(i)
    return 0

checksum = 0
for line in sys.stdin:
    row = [ int(x) for x in line.split('\t') ]
    checksum += check(row)

print(checksum)
