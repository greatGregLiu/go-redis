%% setup 0.1
LIBPATH = '/usr/include/hiredis'; % not used yet
UNIX_ONLY = 'setup script only supports unix systems yet';

if (exist('OCTAVE_VERSION', 'builtin') == 5)
    %% setup for octave follows here
    if isunix
        try
            mkoctfile -Wall -Wextra -v -I/usr/include/hiredis -O2 --mex redis_.c -lhiredis -std=c99 -o ../inst/redis_.mex
        catch
            error('something went wrong\n Make sure you''ve installes octave dev tools and hiredis')
        end%try
    else
        error(UNIX_ONLY)
    end%if isunix
    
else
    %% setup for matlab follows here
    if isunix
        try
            mex -lhiredis -I/. CFLAGS='-fPIC -std=c99 -O2 -pedantic -g' redis_.c -o ../inst/private/redis_.mexa64
        catch
            error('something went wrong.\n Make sure mex is setup correctly (rerun mex -setup) and you''ve installed hiredis')
        end%try
    else
        error(UNIX_ONLY)
    end%if isunix
    
    
end%if MATLAB|OCTAVE