.RECIPEPREFIX = >

test:
> ligo run test tests.jsligo

compile:
> mkdir -p compiled
> ligo compile contract tcp.jsligo -m TCP -o compiled/tcp.tz

originate_ghostnet: 
> export TCP_RPC=https://ghostnet.tezos.marigold.dev/; scripts/originate.sh 
