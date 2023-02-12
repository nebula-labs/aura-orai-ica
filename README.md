# Intergalactic travel

"Space: the final frontier. 
These are the voyages of the starship Enterprise. 
Its five-year mission: to explore strange new worlds, to seek out new life and new civilizations, to boldly go where no man has gone before."

![spaceship](spaceship.avif)

This is a demonstration project to show case the power of Interchain Account

Using Interchain Account, cooperation between chains can reach a higher degree.

This demonstration will invoke an ICA of MsgIBCSend between two chains:

Aura -> ICA{IbcSend} -> Orai -> IbcSend -> Aura

This can further expand to cross - chain wasm interaction through Interchain Account
# Network

## To create universe
1. Planet Aura
2. Planet Orai
3. FTL (Faster - than - light) Hyperlane between Aura and Orai

```
make create-universe
```

## To give your universe life
1. Planet Aura online
2. Planet Orai online
3. Hyperlane online

```
make let-there-be-light
```

# Interaction

## Sending aid from Aura to Orai
This will perform ICA{IBC SEND} from Aura to Orai:
1. Aura will call for aid by sending `ICA{IBC SEND}`
2. Orai will respond with uorai token through `IBC SEND`
3. Aura will receive token uorai (in IBC denom hash)

```
bash interaction/alliance.sh
```