% Consult a graph file before executing.

%%%% findPath(+Start, +End, -Path, -TotalLength)
findPath(Previous, End, [End], TotalLength) :-
	link(Previous, End, TotalLength).

findPath(Start, End, [Next|PathTail], TotalLength) :-
	link(Start, Next, Length),
	notVisited(Next, PathTail),
	findPath(Next, End, PathTail, RecursiveLength),
	TotalLength is Length + RecursiveLength.

notVisited(Node, ListOfNodes) :-
	\+ member(Node, ListOfNodes).
