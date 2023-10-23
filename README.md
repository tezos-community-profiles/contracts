# TCP Contracts

This repo contains the smart contract(s) for the Tezos Community Profiles project.

## Views

You can use TCP Profiles from other contracts by using the `get_profile` view.

## Develop

We have a bunch of test that you can run to verify that your changes work as expected.

```
make test
```

## Compile

Run the compile target to compile the TCP contract. A file `compiled/tcp.tz` will be produced.

```
make compile
```

## Deploy

### Ghostnet

```
make deploy_ghostnet
```

### Mainnet

WIP

enjoy.
