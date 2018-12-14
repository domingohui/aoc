import sys

nums = []
acc = 0
seen_sums = set()
for i in sys.stdin:
    nums.append(int(i))

i = 0
while True:
    acc += nums[x % len]
    if acc in seen_sums:
        print(acc)
        break
    else:
        seen_sums.add(acc)
        i += 1
