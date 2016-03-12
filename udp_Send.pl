%%% Execute using: send(localhost, 8080, echo).

send(Host, Port, Message) :-
        udp_socket(Socket),  						%%% Similar to tcp_socket/1
        udp_send(Socket, Message, Host:Port, []),  	%%% Send a UDP message []:Options
        writeln('Sent to:'),
		writeln(Host:Port),
		writeln(Message),
		
		
		udp_receive(Socket, Data, From, []),
        writeln('Recieved from'),
		writeln(From),
		writeln(Data),
		
		tcp_close_socket(Socket).					%%% Closes the indicated socket, making SocketId invalid.
		
		
		
		
		