def count_change_new(m,n):
  print("这一行是",m,n)
  if(m<=0):return 0
  if(n==1):return 1
  return count_change_new(m-n,n)+count_change_new(m,n//2)

print(count_change_new(10,8))
