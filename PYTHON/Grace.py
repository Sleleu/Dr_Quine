# A comment

NAME = "Grace_kid.py"
CODE = "# A comment%c%cNAME = %cGrace_kid.py%c%cCODE = %c%s%c%cGRACE = f = open(NAME, %cw%c); f.write(CODE %%(10,10,34,34,10,34,CODE,34,10,34,34)); f.close()"
GRACE = f = open(NAME, "w"); f.write(CODE %(10,10,34,34,10,34,CODE,34,10,34,34)); f.close()