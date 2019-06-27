# Reading-and-Manipulating-Temperature-Data
Takes in a matrix of temperature data, fixes bad sensor readings, and graphs temps that are within a target threshold

Objective: Read, manipulate, and graph data

Description: This program uses the load command to retrieve data from the .mat matrix file. The 2nd column in the matrix file is a measured temperature, in Fahrenheit, from a temperature probe. The third column is a target temperature. Columns 1, 4, 7, and 8 are status codes. Column 5 is another reported temperature, and column 6 is another target temperature. The program keeps all the data and analyzes columns 2 and 3.
<----------------------------------------------------------------------------------------------------------------------->
First, the program fixes any bad temperature values. the temperature sensor sometimes loses contact with the monitoring computer. The monitoring computer does not notice when this happens; it will read these values as -1000C, then convert it to Fahrenheit, and store the data. The data are recorded every 3 seconds. Since the temperature changes fairly slowly, the program corrects the bad entries with an average of the previous and next measured temperature entries. The program then prints how many bad values were fixed.
<----------------------------------------------------------------------------------------------------------------------->
Second, the program determines how well the measured temperature matches the target temperature. The user is prompted to enter a threshold of their acceptable amount of variance between the measured and target temperatures. The program displays the number of matches within the threshold, the total number of entries, the percentage of entries within the threshold, then the users entered threshold.
<----------------------------------------------------------------------------------------------------------------------->
Lastly, the program displays a graph with the elapsed time in minutes on the x-axis, the measured temperatures in blue on the y-axis,
and the target temperatures in red on the y-axis.
