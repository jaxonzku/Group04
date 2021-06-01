def logger(text):
    file = open(r"C:\xampp\htdocs\log.txt","a")
    file.truncate(0)

text="hai"
logger(text)

text="jiiii"
logger(text)