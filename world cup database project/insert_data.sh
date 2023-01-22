#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# wipe tables each time
echo $($PSQL "truncate teams, games")

#read team names from games.csv
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

#unique team names -- prob more efficient way to do this..

#winner name
  if [[ $WINNER != 'winner' ]] 
  then
    #get team_id
    TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    
    #if not found
    if [[ -z $TEAM_ID ]]
    then
      INSERT_TEAM_NAME=$($PSQL "insert into teams(name) values('$WINNER')")
      if [[ $INSERT_TEAM_NAME == "INSERT 0 1" ]] 
      then
        echo Inserted winner $WINNER
      fi    
    fi
  fi

#opponent name
  if [[ $OPPONENT != 'opponent' ]]
  then
    #get team_id again to check opponent
    TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")

    #if not found
    if [[ -z $TEAM_ID ]]
    then
      INSERT_TEAM_NAME=$($PSQL "insert into teams(name) values('$OPPONENT')")
      if [[ $INSERT_TEAM_NAME == "INSERT 0 1" ]] 
      then
        echo Inserted opponent $OPPONENT
      fi
    fi
  fi

# add info to games table
  if [[ $YEAR != 'year' ]]
  then
    #relational data team - ids
    WIN_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    OPP_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")

    #insert  data
    INSERT_GAME_DATA=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $WIN_ID, $OPP_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    echo $INSERT_GAME_DATA
  fi
  
done
