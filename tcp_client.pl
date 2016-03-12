%%% Execute using: create_client(localhost,8080).
%%% or create_client(ip(83,212,83,78),8080).
  

:- use_module(library(streampool)).

create_client(Host, Port) :-
    tcp_socket(Socket),
    tcp_connect(Socket, Host:Port),
	writeln('Connected to server'),
        
        
	tcp_open_socket(Socket, In, Out),
	writeln('Opened TCP Socket'),
		
	%%% sent message server
	write(Out,helloworld),
	write(Out,'.\n'),
	flush_output(Out),
	writeln('Sent To Server:'),
	writeln('helloworld'),
   	  
	%%% wait message from server
	read(In, MsgFromServer),
	writeln('Recieved From Server:'),
	writeln(MsgFromServer),
	close(In),
	close(Out),
	tcp_close_socket(Socket).
 