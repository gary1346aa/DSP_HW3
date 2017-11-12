function imageReduced = reduceImageByMask( image, seamMask, isVertical )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Removes pixels by input mask
% Removes vertical line if isVertical == 1, otherwise horizontal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if (isVertical)
        imageReduced = reduceImageByMaskVertical(image, seamMask);
    else
        imageReduced = reduceImageByMaskHorizontal(image, seamMask');
    end;
end

function imageReduced = reduceImageByMaskVertical(image, seamMask)
    % Note that the type of the mask is logical and you 
    % can make use of this.
    
    %%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE:
    %%%%%%%%%%%%%%%%%%
    sz = size(image);
    for i = 1:sz(1)
        locat = find(~seamMask(i,:));
        imageReduced(i,:,:) = [image(i,1:locat-1,:) image(i,locat+1:sz(2),:)];
    end
    %%%%%%%%%%%%%%%%%%
    % END OF YOUR CODE
    %%%%%%%%%%%%%%%%%%
end

function imageReduced = reduceImageByMaskHorizontal(image, seamMask)
    %%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE:
    %%%%%%%%%%%%%%%%%%
    
    for i = 1:3
        image_(:,:,i) = image(:,:,i)';
    end
    seamMask = seamMask.';
    sz = size(image_);
    for i = 1:sz(1)
        locat = find(~seamMask(i,:));
        imageReduced_(i,:,:) = [image_(i,1:locat-1,:) image_(i,locat+1:sz(2),:)];
    end
    
    for i = 1:3
        imageReduced(:,:,i) = imageReduced_(:,:,i)';
    end
    %%%%%%%%%%%%%%%%%%
    % END OF YOUR CODE
    %%%%%%%%%%%%%%%%%%
end
