function f = dataset_generator

bits_num = 7;
prime_table = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97];
prime_numble = 25;
prime_dataset = zeros(100,8);

%Generate prime number dataset 1-100
for count = 1:100
    bin_str = dec2bin(count,bits_num);
    for i = 1:bits_num
        prime_dataset(count,i) = str2num(bin_str(i));
    end
    for i = 1:prime_numble
        if(count == prime_table(i))
            prime_dataset(count,bits_num+1) = 1;
        end
    end
    if(prime_dataset(count,bits_num+1)~=1)
        prime_dataset(count,bits_num+1) = 0;
    end
end

f = prime_dataset;
