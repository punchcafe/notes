# Paste your code into this box
secret_num_guess = 50
high = 100
low = 0
sng_feedback = input("Is your secret number " +str(secret_num_guess) +"?")
while sng_feedback != "c":
    if sng_feedback == "l":
        low = secret_num_guess
        secret_num_guess = int((high+low)/2)
        sng_feedback = input("Is your secret number " + str(secret_num_guess) + "?")
    elif sng_feedback == "h":
        high = secret_num_guess
        secret_num_guess = int((high+low)/2)
        sng_feedback = input("Is your secret number " + str(secret_num_guess) + "?")
    else: sng_feedback = input("Sorry, Incorrect input. Is your secret number" +str(secret_num_guess) +"?")
print ("Game over. Your secret number was:" + str(secret_num_guess))
