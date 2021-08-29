#!/bin/bash
#list variables
#5 Favorite States
states=('Maryland'
'Georgia'
'Texas'
'North Carolina'
'Louisiana')
# Look for Texas
for state in ${states[@]}
do 
if [ $state == 'Texas' ]
then 
     echo "My Dad's favorite state"
else
     echo "My home state is Maryland"
fi
done
