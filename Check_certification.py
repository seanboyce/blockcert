from web3 import Web3, HTTPProvider, IPCProvider, WebsocketProvider
import json

with open('/home/sean/web2py/web2py/applications/Certify/controllers/Certify.json') as f:
    abi = json.load(f)

w3 = Web3(HTTPProvider('https://rpc.tomochain.com'))
contract_address = '0xd432Ff87E9F6BF8AACE8866eD351435EBDD1Ec00'
contract_address = Web3.toChecksumAddress(contract_address)
contract = w3.eth.contract(address = contract_address, abi = abi)

def check_certification(tokenId):   
    tokenId = int(tokenId)
    tx_receipt = contract.functions.viewcert(tokenId).call()
    return(tx_receipt)        

def check_owner(tokenId):
	tokenId = int(tokenId)
    tx_receipt = contract.functions.ownerOf(tokenId).call()
    return(tx_receipt)

tokenId = 0

print (check_owner(tokenId))
print (check_certification(tokenId))
