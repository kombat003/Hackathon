

const cassandra = require('cassandra-driver');
const Web3 = require('web3');
const crypto = require('crypto');

const client = new cassandra.Client({ contactPoints:['127.0.0.1'], keyspace: 'comon' });


try{
var query = "INSERT INTO trading (id_user, id_trade, val, type_pos, open_price, open_date, close_price, close_date) VALUES ((int)123123,(int)31123,'bit', 'short', (double) 321, '2018-05-03 13:30:54.234', (double) 322, '2018-05-03 15:30:54.234')";

var query1 = "INSERT INTO trading (id_user, id_trade, val, type_pos, open_price, open_date, close_price, close_date) VALUES ((int)123,(int)88123,'bit', 'short', (double) 321, '2018-05-03 13:30:54.234', (double) 322, '2018-05-03 15:30:54.234')";


client.execute(query);
client.execute(query1);


}
catch (err) {
console.log(err)
}


var data = "12388123bitshort3212018-05-03 13:30:54.2343222018-05-03 15:30:54.234";

 var web3; 
if (typeof(web3) !== 'undefined') {
  var web3 = new Web3(web3.currentProvider);
} else {
  var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

} 

var abi = [{
     name: 'myConstantMethod',
     type: 'function',
     constant: true,
     inputs: [{ name: 'a', type: 'string' }],
     outputs: [{name: 'd', type: 'string' }]
}, {
     name: 'myStateChangingMethod',
     type: 'function',
     constant: false,
     inputs: [{ name: 'a', type: 'string' }, { name: 'b', type: 'int' }],
     outputs: []
}, {
     name: 'myEvent',
     type: 'event',
     inputs: [{name: 'a', type: 'int', indexed: true},{name: 'b', type: 'bool', indexed: false}]
}];

var MyContract = Web3.eth.contract(abi);


var myContractInstance = MyContract.at('0xc4abd0339eb8d57087278718986382264244252f');



var result = myContractInstance.setData(crypto.createHash('md5').update(data).digest("hex"));
console.log(result) 
