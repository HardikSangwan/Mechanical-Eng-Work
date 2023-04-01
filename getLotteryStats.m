function [winProbObs, winProbAct] = getLotteryStats(nDigits, nPlayers, nGames)

%Checking whether any agruments are missing and assigning default values

if nargin == 0 
    nPlayers=1;
    nDigits=3;
    nGames=1e6;
end
if nargin == 1
   nPlayers=1;
   nGames=1e6;
end
if nargin == 2
   nGames=1e6;
end


%Size of matrix result is equal to the Number of Games * Number of Players
result=zeros(nGames,nPlayers);

wins = 0; %variable for total wins

%Checking number of Digits and producing random lottery results accordingly
%Also checking for any wins
if nDigits == 1
    winningnumber =randi(10)-1;
    winProbAct=1-(0.9^nPlayers);
    for i=1:nGames
        result(i,:)=randi(10,1,nPlayers) - 1;
        win = result(i,:)==winningnumber;
        if any(win)
            wins=wins+1;
        end
    end
end
if nDigits == 2
    winningnumber =randi(100)-1;
    winProbAct=1-(0.99^nPlayers);
    for i=1:nGames
        result(i,:)=randi(100,1,nPlayers) - 1;
        win = result(i,:)==winningnumber;
        if any(win)
            wins=wins+1;
        end
    end
end
if nDigits == 3
    winningnumber =randi(1000)-1;
    winProbAct=1-(0.999^nPlayers);
    for i=1:nGames
        result(i,:)=randi(1000,1,nPlayers) - 1;
        win = result(i,:)==winningnumber;
        if any(win)
            wins=wins+1;
        end
    end
end

winProbObs = sum(wins)/(nGames);

end