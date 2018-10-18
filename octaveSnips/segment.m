function out = segment(input,segmentSize,hopSize)
	i=1;
	j=1;
	while ( j + segmentSize - 1 <= length(input) )
		out(:,i) = input(j:(j+segmentSize-1));
		i = i + 1;
		j = j + hopSize;
	endwhile
endfunction
