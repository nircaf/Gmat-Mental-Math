while(true)
    tic
    x = round(round(rand(1),2)*10000);
    y=0;
    while y<x
        y = round(x*round(rand(1),1)*10);
    end
    answer = round(100*x/y);
    for i=1:4
        if i==1
            answer(i) = round(100*x/y);
        else
            answer(i) =round(answer(1)*rand(1)*2);
            while answer(i) == answer(1)
                answer(i) =round(answer(1)*rand(1)*2);
            end
        end
    end
    [v, w] = unique( answer, 'stable' );
    duplicate_indices = setdiff( 1:numel(answer), w );
    while duplicate_indices
        if duplicate_indices
            answer(duplicate_indices(1)) =round(answer(1)*rand(1)*2);
        end
        [v, w] = unique( answer, 'stable' );
        duplicate_indices = setdiff( 1:numel(answer), w );
    end
    sprintf('What percent is %d of %d ?',x,y)
    p = randperm(4);
    prompt = ('Please choose the correct answer according to order: [1 2 3 4] \n');
    for i=1:4
        disp([num2str(i) ': ' num2str(answer(p(i)))])
    end
    in = input(prompt)
    if  p(in) ==1
%         load  chirp.mat;
        load  chirp.mat;

sound(y);
        disp('Correct :)')
    else
         load train.mat;
sound(y);
        disp('Wrong, better luck next time')
    end
    toc
end