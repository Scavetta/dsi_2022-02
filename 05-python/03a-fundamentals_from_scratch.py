
#%%
print("hello world")

Name =  "Lujain"
name = "Ibrahim"

print(name)

number = 90

print(number)

number_2 = 90.0

print(number_2)

type(name)

variable = False 

type(variable)

my_list = []

print(my_list)
type(my_list)

my_list

Name = "Lujain M"

print(Name)

del Name

print(Name)

Name = ""

print(Name)

type(Name)


number + number_2

result = '1' + '1' 
type(result)

'1' * 5 

# addition, multiplication, division, exponents, remainder

2**3

12 % 6

# Data Containers (Lists, Dictionaries, Tuples, Sets)
# Numpy Arrays (Not built-in))

# lists

my_list = [2, 4.4, Name, name, [1, 2]]|

type(my_list)

print(my_list)

fav_numbers = [13, 7, 7, 4, 2, 94, 27]
students = ['alyazid', 'dona', 'rawan', 'lujain', 'athbah', 'abdulrahman', 'alwaleed']

len(fav_numbers)
sum(fav_numbers)

sum(fav_numbers)/len(fav_numbers)

import numpy as np
np.mean(a)

max(fav_numbers)
min(fav_numbers)

import seaborn as sns

sns.stripplot(fav_numbers)

type(fav_numbers)

fav_numbers[6]

type(my_list[4])

my_list[4][1]

fav_numbers[1] = 5

fav_numbers = [13, 7, 7, 5, 6, 21]

fav_numbers

type(students)

students.append("abdulelah")

print(students)

students.extend(["maryam", "quesa"])

students

#students.append(["maryam", "quesa"])

students.remove("abdulelah")

students

students.pop(0)

students.pop()

students

students.sort()

students.reverse()

students

student_i = students[0:4]
student_ii = students[4:]

student_i
student_ii


#Dictionaries
my_dictionary = {}

type(my_dictionary)

my_dictionary = { "number" : 3, "name" : "ibrahim", "greeting" : "hello"}

my_dictionary["number"]

my_dictionary.keys()
my_dictionary.values()

my_dictionary["number"] = 50

my_dictionary["number_2"] = 50

my_dictionary.pop("number_2")

deleted_pair = my_dictionary.pop("number")

deleted_pair

student_i

# my_dictionary.fromkeys(student_i, student_ii)

my_dictionary.popitem()

my_dictionary

len(students)

len(fav_numbers)

fav_numbers.insert(0, 99)

fav_numbers

len(fav_numbers)

students_numbers = dict(zip(students, fav_numbers))

print(students_numbers)

students_numbers["rawan"] = 7

students_numbers


students_numbers.update({"abdulelah":23})

students_numbers


# if (x == 1):
#   print("x is 1")

#%%
x = 1
y = 1

if (x == 1) and ( y == 1):
    print("both x and y is 1")
    z = x + y
    if (z == 2):
        print("z is an even number")
elif (x == 0) or (y == 0):
    print("either x or y is 0")
else: print("no condition was true")


#%%
result = 1 * 2
print(1 + 2)
x

result

# %%

list(range(0, 7))


# %%

students 
student_name = "noura"

if student_name in students:
    students.remove(student_name)
    print( f"student {student_name} is removed from students list" )
else:
    print(f"{student_name} is not in students list")

print(students)

# %%

x = 10
if  x < 50 :
    print ("x is less than 50")
# %%
name_of_the_day = "Dona"

print( f"my name is {name_of_the_day}")

print( "my name is " + name_of_the_day + "!")

# %%

my_dictionary.fromkeys(students)

# %%

dict.fromkeys(students, fav_numbers)


# %%
