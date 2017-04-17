import random  			# for selecting random elements from lists
import twitter 			# twitter library for posting
import time

consumer_key =    'ncZ4cPtsHg2ZiTdC04rn1KdLB'
consumer_secret = '2fUvsRM3c3C3mD7vCrbDnpA6Xo4TZ9Q2ThyEJTGe4UtgeAqLtY'
oauth_token =     '846758265585373186-zXuACwxT92QE7lyz4s1Y9itfRiVVmX6'
oauth_secret =    'nFLotqwpM9vreE4Ix50mKQfRWxYYjBfTRml8ADPLyHZcE'


## sweet context
x = time.localtime()
weeks = time.strftime("%A", x)

foodMaterial =   [ 'pork', 'beef', 'mutton', 'Dwarf Bean', 'swam' ]
menu =  [ ]
txt = open("chinesefood.txt")
for line in txt:
	line = line.strip('\n')
	menu.append(line)
people = [ ]
names = open("FirstNames.txt")
for line in names:
	line = line.strip('\n')
	people.append(line)
cities = [ ]
world = open("WorldCities.txt")
for line in world:
	line = line.strip('\n')
	cities.append(line)
countries = []
country = open("Countries.txt")
for line in country:
	line = line.strip('\n')
	countries.append(line)

# pick some random words for our tweet
food =   random.choice(foodMaterial)
menus =  random.choice(menu)
template_1 = 'Today is ' +  weeks + ', '+ random.choice(people) + ' cooked an Chinese food that is called '  +  menus + '.'
verb_2 = [' wants to go to ', ' would like to travel to ', ' planed to travel to ']
template_2 = random.choice(people) + random.choice(verb_2) + random.choice(cities) + ' to eat ' + menus + '.'
verb_3 = [' prefer ', ' is more interested in ']
template_3 = 'Compared to '+ random.choice(countries) + "'s food, " + random.choice(people) + " prefer to the Chinese's food."

templates = [template_1, template_2, template_3]

tweet = random.choice(templates)
print tweet

# save your tweet for posterity
with open('Tweets.txt', 'a') as f:
	f.write(tweet + '\n')

# connect to Twitter with our OAuth settings
api = twitter.Api(consumer_key = consumer_key, consumer_secret = consumer_secret, access_token_key = oauth_token, access_token_secret = oauth_secret)

# post tweet
print 'posting tweet...'
try:
	status = api.PostUpdate(tweet)	# try posting
	print '- success!'
except twitter.TwitterError, e:		# if an error, let us know
	print '- error posting!'
	print