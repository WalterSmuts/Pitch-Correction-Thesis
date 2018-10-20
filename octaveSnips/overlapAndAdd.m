function stretchedX = overlapAndAdd(seg)
	% Constants
	windowSize = rows(seg);
	hopSize = windowSize/2;

	% Pre-allocate array
	stretchedX = zeros((rows(seg)*columns(seg)+rows(seg))/2,1);

	% Overlap and add
	begin = 1;
	for (i = 1:(columns(seg)))
		last = begin + windowSize-1;
		stretchedX(begin:last) = stretchedX(begin:last) .+ seg(:,i);
		begin = begin + hopSize;
	endfor
endfunction
