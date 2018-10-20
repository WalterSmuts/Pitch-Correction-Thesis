function clipped = clip(signal,threshold)
	% Force all values under threshold to zero
	signal(abs(signal)<threshold) = 0;

	% Relevant indices
	positiveAndGreater = (signal>0) & (signal>threshold);
	negativeAndGreater = (signal<0) & (signal<-threshold);

	% Reduce values past threshold
	signal(positiveAndGreater) = signal(positiveAndGreater) - threshold;
	signal(negativeAndGreater) = signal(negativeAndGreater) + threshold;
	clipped = signal;
endfunction
