function freq = getFrequencyZCM(signal, prevFreq,sf)
	% Somewhat a voice presence check
	if (max(signal) < 0.02);
		freq = prevFreq;
		return;
	endif

	% Calculate crossing points
	zc = zerocrossing(1:length(signal),signal);

	% If fewer than 3
	if (length(zc) < 3)
		freq = prevFreq;
		return;
	endif

	% Force odd zero crossing amount
	if ( rem(length(zc),2) == 0 )
		zc = zc(1:end-1);
	endif

	% Get considered length
	consideredLength = zc(end) - zc(1);

	% Calculate frequency
	sum = length(zc)-1;
	freq = sum/2*(sf/consideredLength);
endfunction
