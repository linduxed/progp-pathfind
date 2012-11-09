%
% Consult a graph file before executing.
%

% Wrapping predicates for finding shortest path.
fsp(Start, End, MaxLength, Path, TotalLength) :-
	lowestLengthFP(Start, End, 1, MaxLength, Path, TotalLength).

lowestLengthFP(Start, End, RequiredLength, _, Path, TotalLength) :-
	fp(Start, End, Path, RecursiveLength),
	RequiredLength =:= RecursiveLength,
	TotalLength is RecursiveLength.

lowestLengthFP(Start, End, RequiredLength, MaxLength, Path, TotalLength) :-
	RequiredLength < MaxLength,
	lowestLengthFP(Start, End, RequiredLength+1, MaxLength, Path, TotalLength).


% Wrapping predicate for finding path.
fp(Start, End, Path, TotalLength) :-
	findPath(Start, End, [Start], Path, TotalLength).


% Actual pathfinding.
%%%% findPath(+Start, +End, +PathSoFar, -Path, -TotalLength)
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
