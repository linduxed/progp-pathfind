%
% Consult a graph file before executing.
%

% Wrapping predicate for finding shortest path.
%%%% fsp(+Start, +End, +MaxLength, -Path, -TotalLength) :-
fsp(Start, End, MaxLength, Path, TotalLength) :-
	lowestLengthFP(Start, End, 1, MaxLength, Path, TotalLength).

% Is true if the length of a path is equal to the current value stored in
% RequiredLength. This equals to the path with the lowest length.
lowestLengthFP(Start, End, RequiredLength, _, Path, TotalLength) :-
	fp(Start, End, Path, RecursiveLength),
	RequiredLength =:= RecursiveLength,
	TotalLength is RecursiveLength.

% This predicate increments the RequiredLength value when there's no path found
% (by the previous predicate) whose length equals the value of RequiredLength.
% RequiredLength is incremented so that the "floor" (to which the lowest path
% length is compared) is raised.
lowestLengthFP(Start, End, RequiredLength, MaxLength, Path, TotalLength) :-
	RequiredLength < MaxLength,
	lowestLengthFP(Start, End, RequiredLength+1, MaxLength, Path, TotalLength).

% Wrapping predicate for finding path.
fp(Start, End, Path, TotalLength) :-
	findPath(Start, End, [Start], Path, TotalLength).

% Actual pathfinding.
%%%% findPath(+Start, +End, +PathSoFar, -Path, -TotalLength)

% End found.
findPath(Previous, End, PathSoFar, Path, TotalLength) :-
	link(Previous, End, TotalLength),
	append(PathSoFar, [End], Path).

% General recursive case.
findPath(Start, End, PathSoFar, Path, TotalLength) :-
	link(Start, Next, Length),
	notVisited(Next, PathSoFar),
	append(PathSoFar, [Next], NewPath),
	findPath(Next, End, NewPath, Path, RecursiveLength),
	TotalLength is Length + RecursiveLength.

notVisited(Node, ListOfNodes) :-
	\+ member(Node, ListOfNodes).
