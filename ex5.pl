:- module('ex5',
        [author/2,
         genre/2,
         book/4
        ]).

/*
 * **********************************************
 * Printing result depth
 *
 * You can enlarge it, if needed.
 * **********************************************
 */
maximum_printing_depth(100).
:- current_prolog_flag(toplevel_print_options, A),
   (select(max_depth(_), A, B), ! ; A = B),
   maximum_printing_depth(MPD),
   set_prolog_flag(toplevel_print_options, [max_depth(MPD)|B]).



author(1, "Isaac Asimov").
author(2, "Frank Herbert").
author(3, "William Morris").
author(4, "J.R.R Tolkein").


genre(1, "Science").
genre(2, "Literature").
genre(3, "Science Fiction").
genre(4, "Fantasy").

book("Inside The Atom", 1, 1, 500).
book("Asimov's Guide To Shakespeare", 1, 2, 400).
book("I, Robot", 1, 3, 450).
book("I, Robot2", 1, 3, 4500).

book("Dune", 2, 3, 550).
book("The Well at the World's End", 3, 1, 400).
book("The Well at the World's End", 3, 2, 400).
book("The Well at the World's End", 3, 4, 400).
book("The Hobbit", 4, 4, 250).
book("The Lord of the Rings", 4, 4, 1250).

% You can add more facts.
% Fill in the Purpose, Signature as requested in the instructions here

% Signature: authorOfGenre(GenreName, AuthorName)/2
% Purpose: author AuthorName has writen a book of genre GenreName.
authorOfGenre(GenreName, AuthorName) :- genre(Genid, GenreName), author(Autid, AuthorName), book(_, Autid, Genid, _).



% Signature:is_max([X|Xs], R)/2
% Purpose: R is the maximum integer in [X|Xs].
is_max([X|Xs], R):- is_max(Xs, X, R). %start
% Signature:is_max([X|Xs], WK, R)/3
% Purpose: R equals max(WK, all the items in [X|Xs])
is_max([X|Xs], WK, R):- X > WK, is_max(Xs, X, R).
is_max([X|Xs], WK, R):- X =< WK, is_max(Xs, WK, R).
is_max([], R, R). %end

% Signature:longestBook(Authorid, BookName)
% Purpose: Bookname is the longest book the author with id Authorid has
% writen
longestBook(Authorid, BookName):- book(BookName, Authorid, _, Max), findall(Len, book(_, Authorid, _, Len), List), is_max(List, Max).





% Signature:versatileAuthor(authorName)/1
% Purpose: Authorname is an author who wrote books in 3 genres or more
versatileAuthor(AuthorName):- author(Authorid,AuthorName),findall(G, book(_, Authorid, G, _), List),list_to_set(List,Set),
    length(Set,N),N>2 .



