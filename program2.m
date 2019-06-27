%program2.m
%
%Author: Michael Moloney
%Account: mmoloney1
%CSC 4630 Program #2
%
%Due date: 10/09/18
%
%Description:
%Program2 scans a matrix of actual and target temperatures. If the program
%discovers errors caused by a glitch in the thermostat the program
%replaces these entries with the average of the previous and next readings.
%The program then gets a threshold from the user outputs what percentage
%of data entries fall within that threshold. Finally, the program outputs
%a graph comparing the actual temperature readings with the target temps.
%
%Input:
%Matlab file that contains a matrix of temperature data. A user input of
%their desired threshold.
%
%Usage:
%Run prPogram. Info on fixed data is then displayed.
%Enter integer greater than 0 for threshold: 1
%There are 1005 matches within the given threshold.
%There are a total of 1781 entries.
%The percentage of entries within the threshold is  56.
%your entered threshold was:    1.00000.
%Graph is then displayed.
%
%Matlab file of temp data is loaded
load('temperatureData.mat')
%The three functions are ran sequentially
fixValues(tempData);
threshold(tempData);
plotGraph(tempData);
%Function 1 fixValues:
%
%Description:
%Uses a for loop to check every entry in column 2. If it 
%matches -1768(the glitch temperature reading) it then replaces the entry
%with the average of the previous and next entries. The fix info is then
%dispayed and a counter is used to keep track of how many entries were
%fixed. This counter is also displayed.
%
%Input:
%temp data matrix
%
%Output:
%fix information is displayed on command window.
function fixValues(tempData)

count = 0;
numOfColumns = size(tempData,1);

for n=1:numOfColumns
    if tempData(n,2)==-1768
        count = count+1;
        fprintf('Column %d row 2 temperatrue value was fixed.\n',n)
        fprintf('The old value was %8.2f.',tempData(n,2))
        tempData(n,2)=(tempData(n-1,2)+tempData(n+1,2))/2;
        fprintf(' The new value is %8.2f.\n',tempData(n,2))
        fprintf('This is an average of the previous and next temps %8.2f and %8.2f.\n',tempData(n-1,2),tempData(n+1,2))
        
    end
end
fprintf('%d value(s) fixed.',count);

end
%Function 2 threshold:
%
%Description:
%Asks the user to give a desired threshold. The actual temp
%readings are compared to the target temps, if they fall within this
%threshold they are counted. The resulting percentage of entries in range
%are displayed along with the matches, total entries, and threshold input.
%
%Input:
%tempData matrix and user input of integer greater than 0.
%
%Output:
%matches, total entries, percent of temps within threshold, and 
%user's input threshold.
function threshold(tempData)

matches = 0;
entries = size(tempData,1);
percentage = 0;
threshhld = 0;
%Any unauthorized variable assignments will default threshhld to a character. This
%will advance the function to the while loop that continues until the
%proper input is recieved.
try
    threshhld = input('\nEnter integer greater than 0 for threshold: ');
catch
    threshhld = 'c';
end
%This while loop will continually request input until it recieves no more
%than one real float number greater than 0
while (isfloat(threshhld) ~= 1 || length(threshhld) ~= 1 || isreal(threshhld) ~= 1 || threshhld>0 ~= 1)
    %Try/catch is used again to prevent invalid variables such as asdfr223 or
%inputs with spaces such as 44 44 44
    try
        threshhld = input('Enter integer greater than 0 for threshold: ');
    catch
        threshhld= 'c';
    end
end
for n=1:entries
    if abs((tempData(n,3)-tempData(n,2)))<=threshhld
        matches = matches+1;
    end
end
percentage = matches/entries*100;
    fprintf('There are %d matches within the given threshold.\n',matches);
    fprintf('There are a total of %d entries.\n',entries);
    fprintf('The percentage of entries within the threshold is %3.0f.\n',percentage);
    fprintf('your entered threshold was: %10.5f.\n',threshhld);
end
%Function 3 plotGraph:
%
%Description:
%Creates a graph with 90 minutes as the x-axis and the actual temp readings
%and target temp readings as the y-axis. Actuala temp readings are in blue,
%target temp readins are in red.
%
%Input:
%tempData matrix
%
%Output:
%graph
function plotGraph(tempData)

elapsedMin = (1:90);
%tempData columns were cut down to every 20 entries to convert them to
%a display of minutes instead of every 3 seconds.
plot(elapsedMin,tempData(1:20:1781,2),elapsedMin,tempData(1:20:1781,3));
xlabel('Minutes')
ylabel('Temperature')
title('\color{blue}Actual Temp. \color{black}Vs. \color{red}Target Temp.')

end