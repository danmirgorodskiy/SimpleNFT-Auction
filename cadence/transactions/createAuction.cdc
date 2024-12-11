import NFTAuction from 0x06

transaction(nftID: UInt64, startingBid: UFix64) {
    prepare(signer: &Account) {
        NFTAuction.createAuction(nftID: nftID, startingBid: startingBid, owner: signer.address)
    }
}
