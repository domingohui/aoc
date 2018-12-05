import sys

nums = []
acc = 0
seen_sums = set()
for i in sys.stdin:
    nums.append(int(i))

def get_infinite_iter(xs):
    L = len(xs)
    index = 0
    while True:
        if index == L:
            index = 0
        yield xs[index]
        index += 1

it = get_infinite_iter(nums)

for x in it:
    acc += x
    if acc in seen_sums:
        print(acc)
        break
    else:
        seen_sums.add(acc)
