# pizza contract

Solidity smart contract for pizza tracking

## notes

Trying it out

Run the test network locally:

    testrpc

Run the decyphertc console to leverage the utils it bring into you node session:

    decyphertv console

Deploy the contract

    var deployed = decypher.createContract('pizza.sol');

Watch for events

     var events = deployed.allEvents();
     events.watch(function(error, event){
    if (!error)
        console.log(event);
    });

Call some methods

    deployed.finalizeOrder({'from':acct1})




