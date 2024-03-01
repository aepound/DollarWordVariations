% Dollar words

calcWordWorth = @(x) sum(lower(x) - double(int16('a'))+1);

if ~exist('poundNames','var')
  poundNames = {'Jenson', 'Jeana', 'Tylor', 'Felix', 'Heath', ...
   'Sonic', 'Kitty', 'Arden', 'Keara', 'Bodie'}'
end

% This has the worth in col 2, and a normalized cents/letter in the col 3:
[poundNames, cellfun(@(x)calcWordWorth,poundNames,'uni',0), cellfun(@(x)(calcWordWorth(x))./length(x),poundNames,'uni',0)]

%% What about letter frequency?

% From :
% https://www3.nd.edu/~busiforc/handouts/cryptography/letterfrequencies.html
% 1st column is ascii value, 2nd: percentage of use, 3rd is frequency 
% (with Q = 1, then E is 56.88x more likely to be used).
letFreq = [...
 double(int16('E'))	11.1607	56.88 double(int16('M'))	3.0129	15.36 ;...
 double(int16('A'))	8.4966	43.31 double(int16('H'))	3.0034	15.31 ;...
 double(int16('R'))	7.5809	38.64 double(int16('G'))	2.4705	12.59 ;...
 double(int16('I'))	7.5448	38.45 double(int16('B'))	2.0720	10.56 ;...
 double(int16('O'))	7.1635	36.51 double(int16('F'))	1.8121	9.24 ;...
 double(int16('T'))	6.9509	35.43 double(int16('Y'))	1.7779	9.06 ;...
 double(int16('N'))	6.6544	33.92 double(int16('W'))	1.2899	6.57 ;...
 double(int16('S'))	5.7351	29.23 double(int16('K'))	1.1016	5.61 ;...
 double(int16('L'))	5.4893	27.98 double(int16('V'))	1.0074	5.13 ;...
 double(int16('C'))	4.5388	23.13 double(int16('X'))	0.2902	1.48 ;...
 double(int16('U'))	3.6308	18.51 double(int16('Z'))	0.2722	1.39 ;...
 double(int16('D'))	3.3844	17.25 double(int16('J'))	0.1965	1.00 ;...
 double(int16('P'))	3.1671	16.14 double(int16('Q'))	0.1962	1];
letFreq = [letFreq(:,1:3); letFreq(:,4:end)];
[~,srtI] = sort(letFreq(:,1));
letFreq = letFreq(srtI,:);

calcWordWorth2 = @(x,f)sum(f(lower(x) - double(int16('a'))+1));
calcFreqWordWorth = @(x) calcWordWorth2(x,letFreq(:,2))

[poundNames, cellfun(@(x)calcFreqWordWorth(x),poundNames,'uni',0) cellfun(@(x)(calcFreqWordWorth(x))./length(x),poundNames,'uni',0)]


%% Let's make it so hard-to-use letters are worth more:
values = abs(letFreq(:,2) - max(letFreq(:,2)) - min(letFreq(:,2)));

calcWordWorth3 = @(x,f)sum(f(lower(x) - double(int16('a'))+1));
calcFreqWordWorth2 = @(x) calcWordWorth3(x,values)

[poundNames, cellfun(@(x)calcFreqWordWorth2(x),poundNames,'uni',0) cellfun(@(x)(calcFreqWordWorth2(x))./length(x),poundNames,'uni',0)]

%% Scrabble values:
letScrab = [ ...
'A' , 1  ; ...$
'B' , 3  ; ...$
'C' , 3  ; ...$
'D' , 2  ; ...$
'E' , 1  ; ...$
'F' , 4  ; ...$
'G' , 2  ; ...$
'H' , 4  ; ...$
'I' , 1  ; ...$
'J' , 8  ; ...$
'K' , 5  ; ...$
'L' , 1  ; ...$
'M' , 3  ; ...$
'N' , 1  ; ...$
'O' , 1  ; ...$
'P' , 3  ; ...$
'Q' , 10  ; ...$
'R' , 1  ; ...$
'S' , 1  ; ...$
'T' , 1  ; ...$
'U' , 1  ; ...$
'V' , 4  ; ...$
'W' , 4  ; ...$
'X' , 8  ; ...$
'Y' , 4  ; ...$
'Z' , 10  ; ...$
];


calcWordWorth4 = @(x,f)sum(f(lower(x) - double(int16('a'))+1));
calcFreqWordWorth3 = @(x) calcWordWorth4(x,letScrab(:,2));

[poundNames, cellfun(@(x)calcFreqWordWorth3(x),poundNames,'uni',0) cellfun(@(x)(calcFreqWordWorth3(x))./length(x),poundNames,'uni',0)]


