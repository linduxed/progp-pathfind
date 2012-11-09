Simple pathfinder
=================

The task is to find a path from one point to another and find out how long this
path is. We represent edges in a graph like this:

    link(From, To, Distance).

A simple directed graph with egde lenghts could therefore be defined like this:

    link(p0, p1, 5).
    link(p1, p2, 2).
    link(p1, p3, 4).
    link(p2, p1, 2).
    link(p2, p3, 6).

The algorithm should find the path by iteratively increasing the maximum length
of the path. The algorith should handle cyclic graphs.

To start a search, first consult a graph and then run the following command to
find the shortest path:

    fsp(Start, End, MaxLength, Path, TotalLength).

Where ```Start``` and ```End``` are nodes, while ```MaxLength``` is an integer
representing the maximal length of the path at which to stop looking for
a solution.
