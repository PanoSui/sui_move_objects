# Sui Move Objects

Just a very simple example of usage of different types of objects on Sui.

## Execute tests

```bash
sui move test
```

## Deploy on localnet

1. Start localnet

```bash
RUST_LOG=off sui start --with-faucet --force-regenesis
```

2. Switch to localnet and get gas moneys

```bash
sui client switch --env localnet
sui client faucet
```

3. Deploy to localnet

```bash
sui client publish --gas-budget 100000000
```

Take a look at your chain's objects at [Local Suiscan,](https://custom.suiscan.xyz/custom/home?network=http%3A%2F%2F127.0.0.1%3A9000)