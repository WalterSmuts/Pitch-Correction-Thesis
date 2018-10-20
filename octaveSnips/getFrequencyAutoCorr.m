function freq = getFrequencyAutoCorr(signal, prevFreq,sf)
	% Somewhat a voice presence check
	if !isVoiced(signal);
		freq = prevFreq;
		return;
	endif

	% Center Clip Signal
	signal = clip(signal,0.6*max(abs(signal)));

	% Do correlation operation on clipped signal
	x = xcorr(signal);

	% Format and normalize correlation output
	x = x(floor(length(x)/2):end);
	x = x - min(x);

	% Find peaks of correlation
	[peak peakIndex] = findpeaks(x,"MinPeakHeight",0.8*x(1));

	% Check if valid period exists
	if (length(peakIndex)>1)
		freq = 1/peakIndex(2)*44100;
	else
		freq = prevFreq;
	endif
endfunction
