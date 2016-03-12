%%% Execute using: create_server(localhost:8080).
%%% create_server(ip(83,212,83,78):8080).
%%% swipl -s load.pl
:- use_module(library(socket)).


create_server(Address) :-
 
	tcp_socket(Socket),
    tcp_bind(Socket, Address),	%%% Bind the socket to Address on the current machine
    tcp_listen(Socket, 5),
    tcp_open_socket(Socket, StreamPair,_),
	writeln('TCP Server Is Up'),



	tcp_accept(StreamPair, Client, _),
	writeln('TCP Connection Accepted'),
      
    tcp_open_socket(Client, In, Out),
	writeln('Opened TCP Socket'),

	%%% wait message from client
	read(In, MsgFromClient),
	writeln('Recieved From Client:'),
    writeln(MsgFromClient),

	%%% sent message back
	write(Out,MsgFromClient),
	write(Out,'.\n'),
	flush_output(Out),
	writeln('Answered To Client:'),
    writeln(MsgFromClient),

	close(In),
	close(Out).
	
	
	
	
	
	
	
	
       
