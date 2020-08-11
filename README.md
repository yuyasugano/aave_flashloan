## aave flashloan test code in Ropsten

This example show how to loan ETH in Ropsten network in `aave` protocol. 

## Truffle version

Ensure your `Truffle` version is satisfied to compile and migrate your solidity codes in network as follows (some modifications would be required if you run other `Truffle` versions):
```sh
$ truffle version
Truffle v5.0.36 (core: 5.0.36)
Solidity v0.5.8 (solc-js)
Node v13.7.0
Web3.js v1.2.1
```
To get details about `Truffle`, visit https://www.trufflesuite.com/truffle

## Setup steps
 
1. Copy `truffle.js.template` to `truffle.js` and modify variables accordingly. In this tutorial you need to configure your wallet and account information statically in the file. Please do not disclose your credential in public
2. Compile and migrate your code in network
```sh
truffle compile
truffle migrate --network ropsten
```
3. Excecute your flashloan for ETH in Ropsten network
```sh
truffle console --network ropsten
flashloan.flashloan("0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE", web3.utils.toWei("10", "ether"))
```
 
## License

This code is licensed under the MIT License.
