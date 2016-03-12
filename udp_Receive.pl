%%% Execute using: recieve(localhost:8080).

receive(Address) :-
        udp_socket(Socket),			%%% Similar to tcp_socket/1
        tcp_bind(Socket, Address),	%%% Bind the socket to Address on the current machine
        repeat,						%%% Always succeed, provide an infinite number of choice points.
            udp_receive(Socket, Data, From, []),
            writeln('Recieved from'),
			writeln(From),
			writeln(Data),
			
			writeln('Answered to:'),
			writeln(From),
			udp_send(Socket, Data, From, []),
			writeln(Data),
			writeln('-----'),
        fail.		%%% Always fail. The predicate fail/0 is translated into a single virtual machine instruction.