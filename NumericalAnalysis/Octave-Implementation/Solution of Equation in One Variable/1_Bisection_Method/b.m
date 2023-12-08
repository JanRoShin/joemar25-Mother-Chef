% The main function of our program
function main()

    clc; clear;

    % Main Area for Input
    f = @(x) e^x - x^3 - 5;        % equation

    a = -2;                        % interval a
    b = -1;                        % interval b
    TOL = 10^-4;
    N = 15;

    % Function calling
    result = equation_checker(f, a, b);
    if result == 1
      bisection_method(f, a, b, TOL, N);
    else
      display("bisection's first condition not satisfied");
    endif

end

function result = equation_checker(f, a, b)
    fa = f(a);
    fb = f(b);

    result = fa * fb < 0;
end

% The Function implemented for Bisection Method
function bisection_method(f, a, b, TOL, N)

    success = false;
    fprintf('bisection method\n\n%-10s %-10s %-10s %-10s %-10s\n', 'n', 'a', 'b', 'p', 'f(p)')

    % Step 1
    i = 1;
    FA = f(a);

    % Step 2
    while i <= N

        % Print the values of n, An, Bn, Pn, and f(Pn)
        p = a + (b - a) / 2;
        FP = f(p);
        fprintf('%-10d %-10f %-10f %-10f %-10f\n', i, a, b, p, FP);

        % Step 3
        p = a + (b - a) / 2;
        FP = f(p);

        % Step 4
        if FP == 0 || abs(b - a) / 2 < TOL
            fprintf('\nProcedure completed successfully. Root: %f\n', p);

            success = true;
            return
        end

        % Step 5
        i = i + 1;

        % Step 6
        if FA * FP > 0
            a = p;
            FA = FP;
        else
            b = p;
        end

    end

    % Step 7 - if not success
    if ~success
        fprintf('\nMethod failed after %d iterations\n', N);
        fprintf('The procedure was unsuccessful.\n');
    end
end