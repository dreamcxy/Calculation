function [ A ] = generate( m,n )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    A = 100*rand(m,n);
    if rank(A) >= min(m,n)
        A
    else
        A = rand(m,n);
end

