#from ucb import trace

#@trace
#def square(x):
#  return x*x

#square(12)

def funA(desA):
 print("It's funA")
 print('---')
 print(desA)
 desA()
 print('---')
 return 1
 
def funB(desB):
 print("It's funB")
 return
 
def funC():
 print("It's funC")
 return funC

funB(funA(funC()))