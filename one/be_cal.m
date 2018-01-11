compare()

function input_binary = convert_to_bin(input_sequence)

input_binary = '';

for i = 1 : length(input_sequence)
    
    if input_sequence(i) == 'A' || input_sequence(i) == 'T'
        input_binary = strcat(input_binary,'0');
        
    elseif input_sequence(i) == 'G' || input_sequence(i) == 'C'
        input_binary = strcat(input_binary,'1');
        
    end
    
end

end


function bond_energy = get_bond_energy(input_binary) 

bond_energy = 0;

for i = 1 : length(input_binary)
    if input_binary(i) == '0'
        bond_energy = bond_energy + 2;
    else
        bond_energy = bond_energy + 3;
    end
end
end

function compare()

fprintf("Please note that the binary encoding is as follows: \n 1. 0 stands for A and T \n 2. 1 stands for G and C\n\n");

seq_a = input('Enter base sequence A: ', 's');
seq_b = input('Enter base sequence B: ', 's');

bin_a = convert_to_bin(seq_a);
bin_b = convert_to_bin(seq_b);

fprintf("\nThe binary encoding of base sequence A is: %s\n",bin_a);
fprintf("The binary encoding of base sequence B is: %s\n\n",bin_b);

be_a = get_bond_energy(bin_a);
be_b = get_bond_energy(bin_b);

fprintf("The bond energy of sequence A is: %dε(k_b)T\n",be_a);
fprintf("The bond energy of sequence B is: %dε(k_b)T\n\n",be_b);

if be_a > be_b
    fprintf("Molecule A will have a higher melting point\n\n");
elseif be_a < be_b
    fprintf("Molecule B will have a higher melting point\n\n");
else
    fprintf("Both the molecules have the same melting point\n\n");

end
end

