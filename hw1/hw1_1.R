nsum = 0
for (i in 1:100)
{sum = 0
n = 0
while (sum <= 1) {
  sum = sum + runif(1,0,1)
  n = n + 1
}
nsum = nsum +n
}
print(nsum/100)

nsum = 0
for (i in 1:1000)
{sum = 0
n = 0
while (sum <= 1) {
  sum = sum + runif(1,0,1)
  n = n + 1
}
nsum = nsum +n
}
print(nsum/1000)

nsum = 0
for (i in 1:10000)
{sum = 0
n = 0
while (sum <= 1) {
  sum = sum + runif(1,0,1)
  n = n + 1
}
nsum = nsum +n
}
print(nsum/10000)
