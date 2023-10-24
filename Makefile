.RECIPEPREFIX = >

test:
> ligo run test tests.jsligo

compile:
> mkdir -p compiled
> scripts/compile.sh

originate_ghostnet: 
> export TCP_RPC=https://ghostnet.tezos.marigold.dev/; scripts/originate.sh 
