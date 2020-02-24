#!/usr/bin/env python


### runs after having Dataset.csv in working directory, updating with source ~/.profile, and running chmod +x python_scripting.sh


# importing pandas, setting tmp_data for pandas to read csv file, then transfering file to numpy as data.
import pandas as pd
tmp_data = pd.read_csv('Dataset.csv')
data = tmp_data.to_numpy()
# setting up a function that will print only the unique names from the Location list
def unique(num): 
    assert num >= 0, "Input a column number"
    # Creating a list called cols that contains all the data from the col
    cols = (data[:, num]).tolist()
    # new empty list
    unique_list = [] 
    # for any city in col
    for ii in cols: 
        # it will be appended to list if it's not in unique list
        if ii not in unique_list: 
            unique_list.append(ii) 
    # returns the list
    return unique_list
# testing the function with my data
print(unique(1)) # seeing the unique locations
# setting a function that will count a list
def count(numb1, numb2):
    assert numb1 >= 0, "Input a column number"
    assert numb2 >= 0, "Input a column number"
    # creating a new list of lists called bicols that has data from 2 cols
    bicols = (data[:, [numb1,numb2]]).tolist()
    # converting list of lists to list of tuples so it is easier for the program to find uniques/count. 
    bicols = [tuple(i) for i in bicols]
    check = False
    # need new empty list
    new_list = []   
    ii = 0
    # for loop checking if entry in new_list exists.
    for x in bicols: 
        if x in new_list:   
            check = True
            continue
        # if entry is not there it will append it, if there, it will not re-append it but will increase the count of ii
        else: 
            ii = 0
            #
            for y in bicols: 
                if y[0] == x[0] and y[1] == x[1]: 
                    ii = ii + 1
            # printing the number of occurences only for entries with multiple occurences        
            if(ii > 1):  
                print(x, "-", ii) 
            new_list.append(x)  
    if check == False: 
        # let's me know if an entry does not repeat
        print("No repeats")
# testing the function
# ran function successfully on Location_Species
count(1,2)
def mass_plotting(xdata, ystart, yend):
    assert xdata >= 0, "Input x column data"
    assert ystart >= 0, "Input y starting column"
    assert yend >= 0, "Input y ending column"
    # importing matplotlib.pyplot as plt since I need it later
    import matplotlib.pyplot as plt
    # creating a list of all the column names located in header
    header_list = list(tmp_data)
    # since there are several columns describing the climate an individual tree is in,
    # and I want to compare foliar area to all of them, I made a function to plot Foliar Area vs. all of the climate columns
    # for loop searches through columns 19-57 which are the climate ones
    for column in range(ystart, yend):
        column_list = (data[:, [xdata,column]]).tolist()
        assert column_list != 0, "Columns contain no data"
        # made a list of tuples in [(x,y)] format
        column_list = [tuple(i) for i in column_list]
        xval = [x[0] for x in column_list]
        yval = [y[1] for y in column_list]
        # plotted with appropriate x and y labels
        plt.scatter(xval,yval)
        plt.xlabel(header_list[xdata])
        plt.ylabel(header_list[column])
        plt.show()
# testing the function
mass_plotting(9, 19, 57)
# function below uses the csv module and DictReader to have every row be a dictionary where the keys are the header names.
# This function only goes to row 10 (which can be changed)
# it's useful to have in case I need this for any row I want. 
def open_with_dict(file):
    # importing csv module
    import os
    assert os.path.exists(file) == True
    import csv
    with open(file) as f:
        # assigning shorter name to csv.DictReader(f)
        reader = csv.DictReader(f)
        for i, row in enumerate(reader):
            # printing key (header name) and value
            print(dict(row))
            # assignming breaks between dictionaries so it's easier to read
            print("\n")
            # this number is only to stop if from being two long, the actual file will be longer
            if i > 10:
                break
# testing the function
open_with_dict("Dataset.csv")
# A lot of the climate data had the same values since many came from the same area
# I want to count all the occurances for a value for all the climate data columns
# This function counts the occurances for columns 9-56, and pushes the counts to a dictionary for each column
def count_to_dict(ystart, yend):
    for column in range(ystart,yend):
        header_list = list(tmp_data)
        # for loop searches through columns 19-57 which are the climate ones
        column_list = tmp_data["{}".format(header_list[column])].tolist() # {}.format used since column names change
        count_dict = dict() # new dict
        # for loop finds all the occurances of an element and assigns the value as frequency of the element (key)
        for ii in column_list:
            count_dict[ii] = count_dict.get(ii, 0) + 1
        print(count_dict) # printing dict for one column
        print("\n") # helps to space them out
# testing the function
count_to_dict(19, 57)
