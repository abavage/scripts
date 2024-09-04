#!/usr/bin/env python3

import sys
filename = sys.argv[1]

#f=open("source.txt", "r")
file=open(filename, "r")
lines=file.readlines()

#with open(r"1source.txt", 'r') as fp:
with open(filename, 'r') as f:
   line_count = len(f.readlines())

file.close()

# gets column 4 in the file
_average_speed=[]
for i in lines:
    _average_speed.append(i.split() [4])

# split out the minutes [4]:30
minutes=[]
for i in _average_speed:
    minutes.append(i.split(':') [0])

m_total = 0
for i in range(0, len(minutes)):
    m_total = m_total + int(minutes[i])
minutes_decimal  = m_total * 60

# split out the seconds 4:[30]
seconds=[]
for i in _average_speed:
    seconds.append(i.split(':') [1])

s_total = 0
for i in range(0, len(seconds)):
    s_total = s_total + int(seconds[i])
seconds_decimal  = s_total 

_pace = minutes_decimal + seconds_decimal 
pace = round(_pace / line_count,1)

# heart rate
# gets column 6 in the file
_heart_rate=[]
for i in lines:
    _heart_rate.append(i.split() [6])

hr_total = 0
for i in range(0, len(_heart_rate)):
    hr_total = hr_total + int(_heart_rate[i])
heart_rate_total  = round(hr_total / line_count,1)

print("-------")
print("Pace:", pace)
print("HR  :", heart_rate_total)
print("-------")