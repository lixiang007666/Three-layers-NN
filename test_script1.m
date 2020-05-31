function test_script1


%Training Set
data = dataset_generator;
x_train = data(1:60,1:7);
y_train = data(1:60,8);
x_test  = data(61:100,1:7);
y_test = data(61:100,8);

for pow_num = 1:5
    
    %Learning Rate
    alpha = 10^(-3+pow_num);
    
    %Initialize the network
    syn0 = 2*rand(7,15)-1;
    syn1 = 2*rand(15,1)-1;
    
    %Training the network
    for i = 1:60000
        l0 = x_train;
        l1 = sigmoid(l0*syn0);
        l2 = sigmoid(l1*syn1);
        l2_error = l2 - y_train;
        if(i==1)
            overallerror(i) = mean(abs(l2_error));
        end
        if(mod(i,10000)==0)
            overallerror(i/10000+1) = mean(abs(l2_error));
        end
        l2_delta = l2_error.*sigmoid_derivation(l2);
        l1_error = l2_delta*syn1';
        l1_delta = l1_error.*sigmoid_derivation(l1);
        syn1 = syn1 - alpha*(l1'*l2_delta);
        syn0 = syn0 - alpha*(l0'*l1_delta);
    end
    alpha
    overallerror
end



%Testing progress
%testing_output = sigmoid(sigmoid(x_test*syn0)*syn1)
%testing_error = sum(abs(y_test - testing_output))







function s = sigmoid (x)
[m,n] = size(x);
for i = 1:m
    for j = 1:n
        s(i,j) = 1/(1+exp(-x(i,j)));
    end
end

function s = sigmoid_derivation(x)
s = x.*(1-x);
