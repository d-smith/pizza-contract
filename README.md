

testrpc

decyphertv console



var deployed = decypher.createContract('pizza.sol');
deployed.finalizeOrder({'from':acct1})

var event = deployed.OrderReceived();
event.watch((error, result) => {
    console.log(`order received - ${result.args._order}`);
})


var filter = web3.eth.filter('pending');
filter.watch(function(error, result){
    if (!error)
        console.log(result);
});


