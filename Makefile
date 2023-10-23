.RECIPEPREFIX = >

test:
> ligo run test tests.jsligo

compile:
> mkdir -p compiled
> ligo compile contract tcp.jsligo -m TCP -o compiled/tcp.tz 
