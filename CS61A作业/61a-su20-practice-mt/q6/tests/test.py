def func(f1,f2):
  return f1(f2)
def func1(x):
  return x+1
def func2(x):
  return x+2
print(func(func1,func2)(1))