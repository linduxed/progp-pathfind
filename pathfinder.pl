% Consult a graph file before executing.

fp(Start, End, Path, TotalLength) :-
	findPath(Start, End, [Start], Path, TotalLength).

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
